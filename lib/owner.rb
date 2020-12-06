class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    name = Cat.new(name, self)
  end

  def buy_dog(name)
    name = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy"}
  end

  def sell_pets
    Dog.all.each { |dog| dog.mood = "nervous"}
    Dog.all.each { |dog| dog.owner = nil}
    Cat.all.each { |cat| cat.mood = "nervous"}
    Cat.all.each { |cat| cat.owner = nil}
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end