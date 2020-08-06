require_relative './song'

class Artist

  attr_accessor :name     

  @@all = []

  def initialize(name)
    @name = name
    @@all << self 
  end 

  def self.all
    @@all
  end 

  def songs
    Song.all.filter { |song| song.artist == self }
  end 

  def add_song(song)
    song.artist = self 
  end 

  def self.find_or_create_by_name(artist_name)
    if self.all.find { |artist| artist.name == artist_name }.nil?
      Artist.new(artist_name)
    else 
      self.all.find { |artist| artist.name == artist_name }
    end 
  end 

  def print_songs
    self.songs.each { |song| puts song.name }
  end 

end 
