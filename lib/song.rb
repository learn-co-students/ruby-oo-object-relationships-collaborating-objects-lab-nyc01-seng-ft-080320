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
    def artist_name
        self.artist ? self.artist.name : nil 
    end

    def self.new_by_filename(filename)
        song = self.new
        song.name = filename.split(" - ")[1]
        song
      end
    def self.new_by_filename(filename)
        data = filename.split(" - ")
        song = self.new(data[1])
        song.artist = Artist.new(data[0])
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end