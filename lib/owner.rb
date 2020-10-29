require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all 
  end

  def self.count
    self.all.count 
  end
  
  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat_instance| cat_instance.owner == self}
  end

  def dogs
    Dog.all.select {|dog_instance| dog_instance.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_pets = dogs + cats

    all_pets.each do |all_pet|
      all_pet.mood = "nervous"
      all_pet.owner = nil
    end
  end

  def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end