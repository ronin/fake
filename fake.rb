class Fake
  @instance = nil
  
  def self.instance
    if @instance.nil?
      @instance = Fake.new
    end
    
    @instance
  end
end