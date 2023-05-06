bem_vindo = -> (nome) { # Lambda Literal
    puts "Bem vindo #{nome}"
} 

minha_funcao = bem_vindo
minha_funcao.call("Bruno")