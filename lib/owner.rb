require 'pry'

class Owner
attr_accessor
attr_reader :name, :species

@@all = []

def initialize (name)
  @name = name
  @species = "human"
  save
end

def save
  @@all << self
end

def say_species
  "I am a #{@species}."
end

def cats
  Cat.all.select do |cats|
    cats.owner == self
  end
end

 def dogs
   Dog.all.select do |dogs|
     dogs.owner == self
   end
end

 def buy_cat(name)
   Cat.new(name, self)
end

 def buy_dog(name)
   Dog.new(name, self)
 end

 def walk_dogs
   self.dogs.each do |dog|
     dog.mood = "happy"
   end
 end

 def feed_cats
   self.cats.each do |cat|
     cat.mood = "happy"
   end
 end

 def sell_pets
   self.dogs.each do |dog|
     dog.mood = "nervous"
     dog.owner = nil
   end
     self.cats.each do |cat|
       cat.mood = "nervous"
       cat.owner = nil
     end

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

def list_pets
  puts "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end
