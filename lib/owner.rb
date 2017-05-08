require 'pry'
class Owner

attr_reader :species
attr_accessor :fish, :cat, :dog, :name, :pets
@@all=[]

  def initialize(species)
    @pets={:fishes => [], :dogs => [], :cats => []}
    @name=name
    @species=species
    @@all<<self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all=[]
  end

  def say_species
    "I am a #{species}."
  end

  def self.count
    @@all.length
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs]<<Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each{|x| x.mood="happy"}
  end

  def play_with_cats
    self.pets[:cats].each{|x| x.mood="happy"}
  end

  def feed_fish
    self.pets[:fishes].each{|x| x.mood="happy"}
  end

  def sell_pets
    self.pets.map do |pet_type,pet_array|
    pet_array.map {|pet| pet.mood="nervous"}
    end
    @pets={:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets

    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

end
