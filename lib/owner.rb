require 'pry'

class Owner
  # code goes here
  attr_accessor :pets
  attr_reader :name, :species


  @@all = []

  def initialize(name)
    @pets = {
     fishes: [],
     dogs: [],
     cats: []
   }
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    all.length
  end

  def self.reset_all
    all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def name=(name)
    @name = name
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    #binding.pry
    self.pets[:fishes] << new_fish
    #binding.pry
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    #binding.pry
    self.pets[:cats] << new_cat
    #binding.pry
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    #binding.pry
    self.pets[:dogs] << new_dog
    #binding.pry
  end

  def walk_dogs
    self.pets.fetch(:dogs).each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets.fetch(:cats).each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets.fetch(:fishes).each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    #binding.pry
    self.pets.each do |type,names_arr|
      names_arr.each do |each_pet|
        each_pet.mood = "nervous"
      end
    names_arr.clear
    end
  end

  def list_pets
    sent = "I have "
    self.pets.each do |type,names_arr|
      count = names_arr.length
      # if type == :fishes
      #   sent += count.to_s + "#{type[0..-3]},"
      # elsif pets.keys.last == type
      #   sent += count.to_s + ", and #{type[0..-2]}."
      # else
      #   sent += count.to_s + "#{type[0..-2]}(s),"
      # end
      case type
        when :fishes
         sent += count.to_s + " #{type[0..-3]}, "
       when :dogs
         sent += count.to_s + " #{type[0..-2]}(s)"
       when :cats
         sent += ", and " + count.to_s + " #{type[0..-2]}(s)."
       end
    end
    sent
  end





end
