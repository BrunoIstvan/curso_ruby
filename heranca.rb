class Veiculo

    def self.tipo_cambio
        puts "Manual"
    end

    def acelera

        puts "Acelerando veículo..."

    end

    private
        def verifica_combustivel

            puts "Verificando combustível..."

        end

end

class Carro < Veiculo 

    def acelera

        puts "Verificando equipamento..."
        super

    end

    def verifica_combustivel

        # puts "Verificando combustível..."
        super

    end

end

carro = Carro.new

carro.acelera
Carro.tipo_cambio
carro.verifica_combustivel