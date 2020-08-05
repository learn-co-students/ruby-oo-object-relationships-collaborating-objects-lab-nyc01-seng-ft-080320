require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    
    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        metadata = filename.split(" - ")
        song = Song.new(metadata[1])
        song.artist = Artist.find_or_create_by_name(metadata[0])
        song.artist.add_song(song)
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name) 
    end
end