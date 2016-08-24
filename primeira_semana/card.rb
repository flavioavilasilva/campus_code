class Card
  CARDS_FILE = 'cards.txt'
  attr_reader :portugues, :ingles

  def initialize(ingles, portugues)
    @portugues = portugues
    @ingles = ingles
  end

  def self.all
    File.open(CARDS_FILE).readlines.map do |line|
      to_card(line)
    end
  end

  def self.to_card(line)
    faces = line.chomp.split(' -> ')
    Card.new(faces[0], faces[1])
  end

  def self.find(txt)
    all.select do |card|
      card.include? txt
    end
  end

  def self.save(card)
    File.open(CARDS_FILE, 'a+') do |file|
      file.puts card
    end
  end

  def include?(busca)
    ingles.include?(busca) || portugues.include?(busca)
  end

  def to_s
    "#{portugues} -> #{ingles}"
  end
end
