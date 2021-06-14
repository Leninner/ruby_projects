class Node
    attr_accessor :left, :right, :data

    def initialize(data)
      @data = data
      @left = nil
      @right = nil
    end
  end
  
  class Tree
    attr_accessor :root, :data
  
    def initialize(array)
      @data = array.sort.uniq
      @root = build_tree(data)
    end
  
    ## cambiar un array a uno balanciado con BST con los lugares apropiados
    # retornar el nodo 1 del nodo root
  
    def build_tree(array)
      return nil if array.empty?
  
      middle = (array.size - 1) / 2
      root_node = Node.new(array[middle])
  
      root_node.left = build_tree(array[0...middle])
      root_node.right = build_tree(array[(middle + 1)..-1])
  
      root_node
    end
  
    # aceptar un valor a insertar y retornar NIL si el valor ya existe
  
    def insert(value, node = root)
      return nil if value == node.data
  
      if value < node.data
        node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
      else
        node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
      end
    end
  
    # aceptar un valor a borrar
  
    def delete(value, node = root)
      return node if node.nil?
  
      if value < node.data
        node.left = delete(value, node.left)
      elsif value > node.data
        node.right = delete(value, node.right)
      else
        # si el nodo tiene un o ningún hijo
        return node.right if node.left.nil?
        return node.left if node.right.nil?
  
        # si el nodo tiene 2 hijos
        leftmost_node = leftmost_leaf(node.right)
        node.data = leftmost_node.data
        node.right = delete(leftmost_node.data, node.right)
      end
      node
    end
  
    # retornar el nodo con el valor dado, returnar nil si el valor no se encuentra
  
    def find(value, node = root)
      return node if node.nil? || node.data == value
  
      value < node.data ? find(value, node.left) : find(value, node.right)
    end
  
    # # retornar un arreglo con los valores traversales del ábril amplitud-primero
  
    def level_order(node = root, queue = [])
      print "#{node.data} "
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
      return if queue.empty?
  
      level_order(queue.shift, queue)
    end
  
    # los siguientes 3 métodos retornar un array de valores traversales del árbol
    # en su respectivo profundidad_busqueda_primera (DSF) 
  
    def preorder(node = root)
      # Root Left Right
      return if node.nil?
  
      print "#{node.data} "
      preorder(node.left)
      preorder(node.right)
    end
  
    def inorder(node = root)
      # Left Root Right
      return if node.nil?
  
      inorder(node.left)
      print "#{node.data} "
      inorder(node.right)
    end

    def postorder(node = root)
    # Left Right Root
        return if node.nil?

        postorder(node.left)
        postorder(node.right)
        print "#{node.data} "
    end

    # aceptar un nodo y retornar su altura. Retornar -1 si el nodo no existe
    # altura: número de aristas desde un nodo hasta la hoja más baja de su subárbol

    def height(node = root)
        unless node.nil? || node == root
            node = (node.instance_of?(Node) ? find(node.data) : find(node))
        end

        return -1 if node.nil?

        [height(node.left), height(node.right)].max + 1
    end

    # aceptar un nodo y retornar su profundidad. Retornar - 1 si el nodo no existe
    # depth: número de aristas desde la raíz hasta el nodo dado

    def depth(node = root, parent = root, edges = 0)
        return 0 if node == parent
        return -1 if parent.nil?

        if node < parent.data
            edges += 1
            depth(node, parent.left, edges)
        elsif node > parent.data
            edges += 1
            depth(node, parent.right, edges)
        else
            edges
        end
    end

    # comprobar si el árbol está balanceado: la diferencia entre las alturas del subárbol izquierdo
    # y el subárbol derecho de cada nodo no es más de 1

    def balanced?(node = root)
        return true if node.nil?
  
        left_height = height(node.left)
        right_height = height(node.right)
  
      return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)
  
      false
    end
  
    # balancear un árbol desbalanceado
  
    def rebalance
      self.data = inorder_array
      self.root = build_tree(data)
    end
  
    # visualizar un árbol de búsqueda  binaria
  
    def pretty_print(node = root, prefix = '', is_left = true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
  
    private
  
    # método ayuda para encontrar la hoja más a la izquierda
  
    def leftmost_leaf(node)
      node = node.left until node.left.nil?
  
      node
    end
  
    # crear un array INORDER del árbol
  
    def inorder_array(node = root, array = [])
      unless node.nil?
        inorder_array(node.left, array)
        array << node.data
        inorder_array(node.right, array)
      end
      array
    end
  end
  
  # Script de controlador
  
  array = Array.new(15) { rand(1..100) }
  bst = Tree.new(array)
  
  bst.pretty_print
  
  puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'
  
  puts 'Level order traversal: '
  puts bst.level_order
  
  puts 'Preorder traversal: '
  puts bst.preorder
  
  puts 'Inorder traversal: '
  puts bst.inorder
  
  puts 'Postorder traversal: '
  puts bst.postorder
  
  10.times do
    a = rand(100..150)
    bst.insert(a)
    puts "Inserted #{a} to tree."
  end
  
  bst.pretty_print
  
  puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'
  
  puts 'Rebalancig tree...'
  bst.rebalance
  
  bst.pretty_print
  
  puts bst.balanced? ? 'Your Binary Search Tree is balanced.' : 'Your Binary Search Tree is not balanced.'
  
  puts 'Level order traversal: '
  puts bst.level_order
  
  puts 'Preorder traversal: '
  puts bst.preorder
  
  puts 'Inorder traversal: '
  puts bst.inorder
  
  puts 'Postorder traversal: '
  puts bst.postorder