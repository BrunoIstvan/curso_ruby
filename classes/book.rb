require_relative "product.rb"
require_relative "press.rb"

class Book < Product

    include Press

    def initialize(title, price, release_year, allow_reprint, editor, has_overcoat)
        super(title, price, release_year, editor)
        @allow_reprint = allow_reprint
        @has_overcoat = has_overcoat
    end

    # auxilia no duck type
    def matches?(query)
        ['book', 'press'].include?(query)
    end

    def to_csv()
        "#{@title},#{@release_year},#{@price},#{@editor},#{@allow_reprint},#{@has_overcoat}"
    end

end

