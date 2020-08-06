require 'pry'
class Song
    attr_reader :artist
    attr_accessor :name
    @@all = []
    
    def initialize(name)
        self.name = name
        @artist = ""
        @@all << self
    end

    def artist=(artist)
        @artist = artist
        if !artist.songs.include?(self)
            artist.add_song(self)
        end
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        # self.artist ? self.artist.name : nil
    end

    def self.all
        @@all
    end

    def self.new_by_filename(song_name)
        info = song_name.split(" - ")
        song = self.new(info[1])
        song.artist = Artist.new(info[0])
        song
    end
end