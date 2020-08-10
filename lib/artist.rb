class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.filter do |songs|
            songs.artist == self  
        end      
    end
    
    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        query = @@all.find do |artist|
            artist.name == name
        end
        return query ? query : self.new(name)
    end


    def self.all
        @@all
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

end