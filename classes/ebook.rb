require_relative "product.rb"

class EBook < Product

    # auxilia no duck type
    def matches?(query)
        ['ebook', 'digital'].include?(query)
    end

    def to_csv()
        "#{@title},#{@release_year},#{@price},#{@editor}"
    end

end

