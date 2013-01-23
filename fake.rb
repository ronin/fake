require 'stringex'

class Fake
  @instance = nil
  
  def self.instance
    if @instance.nil?
      @instance = Fake.new
    end
    
    @instance
  end
  
  def initialize
    @last_names = File.readlines('data/last-names.txt').map(&:strip)
    @male_names = File.readlines('data/male-names.txt').map(&:strip)
    @female_names = File.readlines('data/female-names.txt').map(&:strip)
    @domains = File.readlines('data/domains.txt').map(&:strip)
    @provinces = File.readlines('data/provinces.txt').map(&:strip)
    @cities = File.readlines('data/cities.txt').map(&:strip)
    @streets = File.readlines('data/streets.txt').map(&:strip)
    
    nil
  end
  
  def first_name(g = nil)
    gender = g || rand(2)
    
    if gender == 0
      return @male_names.sample
    else
      return @female_names.sample
    end
  end
  
  def last_name(g = nil)
    gender = g || rand(2)
    
    last_name  = @last_names.sample
    
    if gender == 1 && last_name[last_name.length - 1] == 'i'
      last_name[last_name.length - 1] = 'a'
    end
    
    return last_name
  end
  
  def name
    g = rand(2)

    return [first_name(g), last_name(g)].join(' ')
  end
  
  def name_array
    g = rand(2)

    return [first_name(g), last_name(g)]    
  end
  
  def phone
    number = '+48 '
    
    9.times do |i|
      number << "0123456789".split('').sample
      number << " " if [2, 5].include?(i)
    end
    
    number
  end
  
  def city
    @cities.sample
  end
  
  def street
    @streets.sample
  end
  
  def province
    @provinces.sample
  end
  
  def domain
    @domains.sample
  end
  
  def user
    g = rand(2)
    
    first_name = first_name(g)
    last_name  = last_name(g)
    email = "#{first_name.to_url}.#{last_name.to_url}@#{domain}"
    
    [first_name, last_name, phone, province, city, "#{SecureRandom.random_number(99) + 1}-#{SecureRandom.random_number(999) + 1}", street, "#{SecureRandom.random_number(199) + 1}", email]
  end  
end