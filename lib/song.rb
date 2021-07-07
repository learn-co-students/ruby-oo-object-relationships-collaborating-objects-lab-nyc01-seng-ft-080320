require 'pry'

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

    #Parse out the filename into 1. artist, 2. song_name, 3. genre
    def self.new_by_filename(filename)
        data = filename.split(" - ")
        artist = data[0]
        song_name = data[1]
        #genre = data[2].delete_suffix(".mp3") #genre not needed here
        new_song = self.new(song_name)
        new_song.artist_name = artist
        new_song
    end

    #Assign the song's artist a pointer to an Artist instance. Then use that instance to add a song.
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


end
