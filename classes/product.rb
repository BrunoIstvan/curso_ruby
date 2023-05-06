
class Product

    attr_reader :title, :release_year, :price, :editor

    def initialize(title, price, release_year, editor)
        @title = title
        @release_year = release_year
        @editor = editor
        @price = calculate_price(price)
    end

    private
    def calculate_price(base)
        if @release_year < 2006
            if @allow_print
                base * 0.9
            else
                base * 0.95
            end
        elsif @release_year <=2010
            base * 0.96
        else
            base
        end
    end

end

