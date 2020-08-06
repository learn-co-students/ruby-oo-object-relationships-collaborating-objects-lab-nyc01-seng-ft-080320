require 'pry'
class Artist
    attr_accessor :name, :songs
    @@songs_count = 0
    @@all = []
    def initialize(name)
        self.name = name
        @songs = []
        @@all << self
    end
    
    def add_song(song)
        @songs << song
        @@songs_count += 1
        if song.artist != self
            song.artist = self
        end
    end

    def add_song_by_name (song_name)
        new_song = Song.new(song_name)
        add_song(new_song)
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

    def self.all
        @@all
    end
    def self.song_count
        @@songs_count
    end
    def self.find_or_create_by_name(name)
        artist_in_question = @@all.find do |artist|
            artist.name == name
        end
        return artist_in_question ? artist_in_question : self.new(name)
    end
    
end