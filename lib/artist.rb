class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #Tells the passed-thru song to assign "self" as its artist.
    def add_song(song)
        song.artist = self
    end

    #Access the Song
    def songs
        Song.all.find_all {|song| song.artist == self}
    end

    #Allows Artist to find a particular instance matching the input name
    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    #Does this artist exist? If so, return it, else make it.
    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else 
            self.new(name)
        end
    end

        #Finds all the songs by the self Artist, then for each, puts out the name
    def print_songs
        songs.each {|song| puts song.name}
    end
end