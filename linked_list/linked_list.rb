class LinkedList  # Lista completa
    def initialize
        @head = nil
        @length = 0
    end
    
    def append(data)
        new_node = Node.new(data)
        if @head 
            current_node = @head
                until current_node.next_node === nil do
                    current_node = current_node.next_node 
                end
            current_node.next_node = new_node
        else
            @head = new_node
        end  
        @length += 1   
    end  

    def prepend(data)
        new_node = Node.new(data)
        if @head
            new_node.next_node = @head
            @head = new_node
        else 
            @head = new_node
        end  
        @length += 1  
    end  
    
    def size
        @length
    end  
    
    def head
        @head.data
    end  
    
    def tail
        current_node = @head
        until current_node.next_node === nil do
            current_node = current_node.next_node   
        end
        current_node.data 
    end  
    
    def at (index)
        count = 0
        current_node = @head
        if @head
            while count < index do
                count += 1
                current_node = current_node.next_node
            end
        current_node.data
        else
            "La lista está vacía"  
        end
    end  
    
    def pop 
        if @head
            current_node = @head
            previous_node = nil
            until current_node.next_node === nil do
                previous_node = current_node
                current_node = current_node.next_node
            end
            previous_node.next_node = nil  
            @length -= 1
        else
            "La lista está vacía"
        end
    end  
    
    def contains? (item)
        contains = false
        current_node = @head
        count = 0
        until count === @length do
            if current_node.data === item
                contains = true
            else
                current_node = current_node.next_node
            end 
            count += 1 
        end  
        contains
    end  
    
    def find (value)
        index = 0
        current_node = @head
        if @head
            until current_node.next_node === nil do
                if current_node.data === value 
                    return index
                else
                index += 1
                current_node = current_node.next_node
            end
        end
        "Valor no encontrado"
        else
            "La lista está vacía"            
        end
    end  
    
    def to_s
        if @head
            current_node = @head
                until current_node.next_node === nil do
                    print "#{current_node.data} -> "
                    current_node = current_node.next_node
                end  
            print "nil"
        else
            puts "list is empty" 
        end   
    end
    
end

class Node
    attr_accessor :data, :next_node
    def initialize (data)
        @data = data
        @next_node = nil
    end
end

list_1 = LinkedList.new
list_1.append(2)
list_1.append(3)
list_1.append(45)
list_1.append(7)
list_1.prepend(1)
puts list_1.to_s