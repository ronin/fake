class Fake
  @instance = nil
  
  def self.instance
    if @instance.nil?
      @instance = Fake.new
    end
    
    @instance
  end
  
  def initialize
    @cities = File.readlines('data/cities.txt').map(&:strip)
    @last_names = File.readlines('data/last_names.txt').map(&:strip)
    
    nil
  end
  
  # Metoda, która losuje płeć
  def gender
    rand(2)
  end
  
  # Metoda, która generuje losowy numer telefonu
  def phone
    number = '+48 '
    
    9.times do |i|
      number << "0123456789".split('').sample
      number << " " if [2, 5].include?(i)
    end
    
    number
  end
  
  # Metoda, która generuje polskie nazwisko
  def last_name
    @last_names.sample
  end
  
  # Metoda, która generuje nazwę miasta
  def city
    @cities.sample
  end
end