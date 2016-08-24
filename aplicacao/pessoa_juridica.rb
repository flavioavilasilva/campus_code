require_relative 'pessoa'

class PessoaJuridica
  attr_reader :nome_empresa, :cnpj

  def initialize(nome_empresa, cnpj)
    @nome = nome_empresa
    @cnpj = cnpj
  end
end
