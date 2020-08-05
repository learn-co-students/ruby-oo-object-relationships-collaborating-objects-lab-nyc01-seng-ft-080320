class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name

        self.class.all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.filter do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found_name = self.all.filter do |artist|
                artist.name == name
            end
        if found_name.length > 0
            found_name[0]
        else 
            Artist.new(name)
        end

    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end