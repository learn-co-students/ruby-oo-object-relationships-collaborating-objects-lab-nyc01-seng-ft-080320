require_relative './artist'

class Song

  attr_accessor :name, :artist
  
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end 

  def self.all
    @@all
  end 

  def self.new_by_filename(some_filename)
  
  end 

  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
  end 

end 