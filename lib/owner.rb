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
    if cats.find {|cat| cat.name == name}
      cats.find {|cat| cat.name == name}
    else
      buy = Cat.new(name, self)
    end
    # if Cat.all.find {|cat| cat.name == name}
    #     Cat.all.find {|cat| cat.name == name}
    # else
    #   new_cat = Cat.new(name, self)
    # end
  end
  
  def buy_dog(name)
    if dogs.find {|dog| dog.name == name}
      dogs.find {|dog| dog.name == name}
    else
      buy_dog = Dog.new(name, self)
    end
  end
  
  def walk_dogs
    # Dog.all.each {|dog| dog.mood = "happy"}
    dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    # Cat.all.each {|cat| cat.mood = "happy"}
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    # Cat.all.each {|cat| cat.mood = "nervous"}
    # Dog.all.each {|dog| dog.mood = "nervous"}
    # Cat.all.each {|cat| cat.owner = nil}
    # Dog.all.each {|dog| dog.owner = nil}
    cats.each {|cat| cat.mood = "nervous"; cat.owner = nil}
    dogs.each {|dog| dog.mood = "nervous"; dog.owner = nil}
  end
  
  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
  
end