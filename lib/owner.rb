require "pry"
class Owner
  attr_reader :pets, :species, :name
  #note on pets writer: this is needed by test.  We should really
  #have explicit method that verifies pets hash is valid
  #or require Owner buys pets (remove writer)
  attr_writer :pets, :name

  @@all = []

  def initialize (species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @name = nil
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end
  def play_with_cats
    @pets[:cats].each { | cat | cat.mood="happy"}
  end
  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end
  def walk_dogs
    @pets[:dogs].each { | dog | dog.mood="happy"}
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end
  def feed_fish
    @pets[:fishes].each { | fish | fish.mood="happy"}
  end

  def sell_pets
    @pets.each do | key, val |
      val.each { | pet | pet.mood="nervous"}
      val.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

  def self.all
    @@all
  end
  def self.reset_all
    @@all.clear
  end
  def self.count
    @@all.count
  end
end
