class Map

    attr_accessor :content

    def read_map(model)
        file_name = "map#{model}.txt"
        text = File.read(file_name)
        self.content = text.split("\n")
        self.content
    end

end