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
end