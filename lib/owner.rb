require 'pry'
class Owner
  attr_reader :species
  attr_accessor :name, :pets, :mood

@@all=[]
@@count=0
  def initialize(name,species="human")
    @name=name
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all<<self
    @@count+=1
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@count=0
  end

  def self.count
    @@count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    # new_fish = Fish.new(fish_name)
    # self.pets[:fishes] << new_fish
    self.pets[:fishes] << Fish.new(fish_name)

  end

  def buy_cat(cat_name)
    # new_fish = Fish.new(fish_name)
    # self.pets[:fishes] << new_fish
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    # new_fish = Fish.new(fish_name)
    # self.pets[:fishes] << new_fish
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].map do |dog_object|

      dog_object.mood="happy"
    end
  end

  def play_with_cats
    self.pets[:cats].map do |cat_object|

      cat_object.mood="happy"
    end
  end

  def feed_fish
    self.pets[:fishes].map do |fish_object|

      fish_object.mood="happy"
    end
  end

  def sell_pets
    self.pets.map do | pet_type, pet_data_array|
      pet_data_array.map do | pet_object|
        pet_object.mood="nervous"
      end
    end
    clear_pet_array
  end

  def clear_pet_array
    self.pets.map do |pet_type, pet_data_array|
      pet_data_array.clear
    end
  end

  def list_pets

      "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."

  end

end
