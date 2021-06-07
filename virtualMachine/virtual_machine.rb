class Computer
    @@users = {}
    def initialize (username, password)
        @@users[username] = password #Para que su hash @@ users mantenga los nombres de usuario como claves con la contraseña de cada nombre de usuario como valor asociado. 
        @username = username
        @password = password
        @files = {}
    end
    def create (filename)
        time = Time.now
        @files[filename] = time
        p "Hola #{@username}, la hora actual es #{time} y tu contraseña es: #{@password}"
    end
    def Computer.get_users
        return @@users
    end
end

my_computer = Computer.new("Lenin", 65408489156)