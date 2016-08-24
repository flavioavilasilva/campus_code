require_relative 'card'

INSERT_CARD = 1
PRINT_CARDS = 2
SEARCH      = 3
END_SYSTEM  = 4

def menu
  puts "Digite a opção desejada"
  puts "[#{INSERT_CARD}] Inserir um novo card"
  puts "[#{PRINT_CARDS}] Exibir todos os cards"
  puts "[#{SEARCH}] Buscar um card"
  puts "[#{END_SYSTEM}] Sair"
  puts
  print 'Escolha uma opção: '
  opcao = gets.to_i
  clear_screen
  opcao
end

def recebe_card
  puts 'Insira uma expressão em Português:'
  portugues = gets.chomp
  puts 'Insira uma expressão em Ingles:'
  ingles = gets.chomp
  # card = { portugues: portugues, ingles: ingles }
  card = Card.new(portugues, ingles)
  clear_screen
  puts "Você inseriu o card: #{card.to_s}"
  puts
  Card.save(card)
end

def print_cards
  puts Card.all
  puts
end

def clear_screen
  system('clear')
end

def search_card
  clear_screen
  print 'Informe o texto que deseja procurar: '
  busca = gets.chomp
  selected_cards = Card.find(busca)
  puts "Cards encontrados: #{selected_cards.count}"
  puts selected_cards
end

clear_screen
puts 'Bem vindo ao Cards System'

# cards = File.open('cards.txt', 'w+')
opcao = -1
while opcao != END_SYSTEM
  opcao = menu
  if opcao == INSERT_CARD
    recebe_card
  elsif opcao == PRINT_CARDS
    print_cards
  elsif opcao == SEARCH
    search_card
  elsif opcao == END_SYSTEM
    puts 'Obrigado por utilizar o Cards System'
  else
    puts 'entre com uma opcao válida'
    puts
  end
end
