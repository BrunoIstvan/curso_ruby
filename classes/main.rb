require_relative "book.rb"
require_relative "ebook.rb"
require_relative "audiobook.rb"
require_relative "magazine.rb"
require_relative "stock.rb"

product1 = Book.new("book1", 100, 1998, true, "Editora D", true)
product2 = Book.new("book2", 10, 2010, true, "Editora W", false)
product3 = EBook.new("ebook1", 88, 2000, "Editora B")
product4 = EBook.new("ebook2", 104, 2012, "Editora C")
product5 = Magazine.new("magazine1", 33, 2011, "Editora A", true, 2)
product6 = Magazine.new("magazine2", 77, 2013, "Editora B", true, 3)
product7 = AudioBook.new("audiobook1", 24, 2018, "Editora B")
product8 = AudioBook.new("audiobook2", 43, 2019, "Editora B")

# adicionando produtos no estoque
stock = Stock.new
stock.products << product1 << product1 << product1 << product1 << product1 << product2 << product2 << product2 << product2
stock.products << product3 << product3 << product3 << product4 << product4
stock.products << product5 << product5 << product5 << product5 << product6 << product6 << product6
stock.products << product7 << product8

# exportando para formato csv
puts "\nExportando para CSV todo o estoque"
puts '-----------------------'
stock.export_csv()

# verificando o tamanho do estoque
puts "\nTamanho do estoque: #{stock.max_stock()}"

# verificando o total de produtos no estoque
puts "\nTotal de produtos no estoque: #{stock.total()}"

# retornando os produtos mais baratos até 90,00
cheapers = stock.more_cheaper_than(90)
puts "\nProdutos com preço abaixo de 90.00"
puts '-----------------------'
cheapers.each do |product| 
    puts product.to_csv() 
end

# vendendo o product1 2 vezes
stock.sell product1 # book1
stock.sell product1 # book1
stock.sell product2 # book2
# stock.sell product2
# stock.sell product2
stock.sell product3 # ebook1
stock.sell product4 # ebook2
stock.sell product4 # ebook2
stock.sell product5 # magazine1
stock.sell product5 # magazine1
stock.sell product6 # magazine2
stock.sell product7 # audiobook1
stock.sell product8 # audiobook2
stock.sell product8 # audiobook2

puts "\nImprimindo todas as vendas"
puts '-----------------------'
stock.sells.each do |product| 
    puts product.to_csv() 
end

# verificando que o tamanho do estoque se manteve
puts "\nTamanho do estoque: #{stock.max_stock()}"

# verificando que o total de produtos diminuiu depois da venda
puts "\nTotal de produtos no estoque: #{stock.total()}"

puts "\nLivro mais vendido por título: #{stock.book_best_seller_by_title().title}"
puts "\nebook mais vendido por título: #{stock.ebook_best_seller_by_title().title}"
puts "\nRevista mais vendida por título: #{stock.magazine_best_seller_by_title().title}"
puts "\nAudiobooks mais vendida por título: #{stock.audiobook_best_seller_by_title().title}"

puts "\nAno de lançamento dos livros mais vendidos: #{stock.book_best_seller_by_release_year().release_year}"
puts "\nAno de lançamento dos ebooks mais vendidos: #{stock.ebook_best_seller_by_release_year().release_year}"
puts "\nAno de lançamento das revistas mais vendidas: #{stock.magazine_best_seller_by_release_year().release_year}"
puts "\nAno de lançamento dos audiobooks mais vendidos: #{stock.audiobook_best_seller_by_release_year().release_year}"

puts "\nEditora que mais vendeu livros: #{stock.book_best_seller_by_editor().editor}"
puts "\nEditora que mais vendeu ebooks: #{stock.ebook_best_seller_by_editor().editor}"
puts "\nEditora que mais vendeu revistas: #{stock.magazine_best_seller_by_editor().editor}"
puts "\nEditora que mais vendeu audiobooks: #{stock.audiobook_best_seller_by_editor().editor}"













# class Conversor
#     def string_to_alphanumeric(title)
#         title.gsub /[^\w\s]/,''
#     end
# end

# class Float
#     def to_coin
#         value = "R$" << self.to_s.tr('.', ',')
#         value << "0" unless value.match /(.*)(\d{2})$/
#         value
#     end
# end
