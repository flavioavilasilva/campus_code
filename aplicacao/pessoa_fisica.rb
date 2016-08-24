require_relative 'pessoa'

class PessoaFisica < Pessoa
  attr_reader :cpf

  def initialize(nome, sobrenome, cpf)
    @nome = nome
    @sobrenome = sobrenome
    @cpf = cpf
  end
end
