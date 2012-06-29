class Fake
  @instance = nil
  
  def self.instance
    if @instance.nil?
      @instance = Fake.new
    end
    
    @instance
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
end