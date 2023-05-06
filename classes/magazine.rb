require_relative "product.rb"
require_relative "press.rb"

class Magazine < Product

    include Press

    def initialize(title, price, release_year, editor, allow_reprint, number)
        super(title, price, release_year, editor)
        @allow_reprint = allow_reprint
        @number = number
    end

    # auxilia no duck type
    def matches?(query)
        ['magazine', 'press'].include?(query)
    end

    def to_csv()
        "#{@title},#{@release_year},#{@price},#{@editor},#{@allow_reprint},#{@number}"
    end

end

