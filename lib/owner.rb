require 'pry'
class Owner
  
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def name
    @name
  end
  
  def species
    @species
  end
  
  def say_species
    return "I am a #{@species}."  
  end
  
  def self.all 
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    if Cat.all.find {|cat| cat.name == name}
        Cat.all.count {|cat| cat.name == name}
    else
      new_cat = Cat.new(name)
    end
  end
  
  def buy_dog(name)
  end
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    Cat.all.each {|cat| cat.mood = "nervous"}
    Dog.all.each {|dog| dog.mood = "nervous"}
    Cat.all.each {|cat| cat.owner = ""}
    Dog.all.each {|dog| dog.owner = ""}
  end
  
  def list_pets
  end
  
end