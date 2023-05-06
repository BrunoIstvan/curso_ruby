require_relative "counter.rb"

class Stock

    attr_reader :products, :sells

    def initialize() 
        @products = []
        @sells = []
        @products.extend Counter
    end

    def total_sells_by(type, product, &field)
        @sells.select {|sell| sell.matches?(type)}.count {|s| field.call(s) == field.call(product)}
    end

    def best_seller_by(type, &field)
        @sells.select {|sell| sell.matches?(type)}.sort {|s1, s2| 
            total_sells_by(type, s1, &field) <=> total_sells_by(type, s2, &field)
        }.last
    end

    def best_seller_by_title(type)
        best_seller_by(type, &:title)
        # @sells.sort {|s1, s2| 
        #     total_sells_by(s1, &:title) <=> total_sells_by(s2, &:title)
        # }.last
    end

    def best_seller_by_release_year(type)
        best_seller_by(type, &:release_year)
        # @sells.sort {|s1, s2| 
        #     total_sells_by(s1, &:release_year) <=> total_sells_by(s2, &:release_year)
        # }.last
    end

    def best_seller_by_editor(type)
        best_seller_by(type, &:editor)
        # @sells.sort {|s1, s2| 
        #     total_sells_by(s1, &:editor) <=> total_sells_by(s2, &:editor)
        # }.last
    end

    # esse método permite substituir os métodos best_seller_by_title, best_seller_by_release_year e best_seller_by_editor agora passando o type no inicio do método
    # exemplo: book_best_seller_by_editor, magazine_best_seller_by_release_year, ebook_best_seller_by_title, etc
    # Isso tudo permite gerar métodos dinâmicos
    def method_missing(name)
        matcher = name.to_s.match("(.+)_best_seller_by_(.+)")
        if matcher
            type = matcher[1]
            field = matcher[2].to_sym()
            best_seller_by(type, &field)
        else 
            super
        end
    end
    # complemento do método method_missing
    def respond_to?(name)
        matched = name.to_s.match("(.+)_best_seller_by_(.+)")
        !!(matched) || super
    end

    def <<(product)
        @products << product if product
        self
    end

    def sell(product)
        @products.delete(product) if product
        @sells << product if product
    end

    def max_stock()
        @products.max_stock()
    end

    def more_cheaper_than(value)
        distinct = []
        @products.select { |product|
            product.price <= value
        }.each { |product| 
            distinct << product if !distinct.include?(product)
        }
        distinct
    end

    def total()
        @products.size
    end

    def export_csv()
        @products.each_with_index do |product, index|
            puts "#{index+1} - #{product.to_csv()}"
        end
    end

end