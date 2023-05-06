
module Counter

    attr_reader :max_stock

    def <<(book)
        push(book)

        if @max_stock.nil? || @max_stock < size
            @max_stock = size
        end
        self
    end

end
