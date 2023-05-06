require_relative "product.rb"

class AudioBook < Product

    # auxilia no duck type
    def matches?(query)
        ['audiobook', 'digital'].include?(query)
    end

    def to_csv()
        "#{@title},#{@release_year},#{@price},#{@editor}"
    end

end

