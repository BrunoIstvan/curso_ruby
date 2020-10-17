class Carro 

    def initialize(marca, modelo)
        @marca = marca
        @modelo = modelo
    end

    attr_accessor :marca, :modelo
    # attr_reader :marca, :modelo
    # attr_writer :marca, :modelo

    def set_velocidade_maxima(vm)
        @vm = vm
    end

    def descricao
        "Marca: #{@marca} - Modelo: #{@modelo} - Velocidade Máxima: #{@vm}"
    end

    def velocidade_maxima
        @vm
    end

end


carro = Carro.new marca="Honda", modelo="Fit"
carro.set_velocidade_maxima 200
puts carro.descricao

carro.marca = "Nissan"
carro.modelo = "Livina"
carro.set_velocidade_maxima(220)
puts "Marca: #{carro.marca} - Modelo: #{carro.modelo} - Velocidade Máxima: #{carro.velocidade_maxima}"

carro.marca = "Volkswagen"
carro.modelo = "Golf"
carro.set_velocidade_maxima(250)
puts carro.descricao
