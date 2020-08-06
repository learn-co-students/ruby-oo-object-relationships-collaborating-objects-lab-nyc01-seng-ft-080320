class Song
    # attr_reader :name
    attr_accessor :artist, :name, :artist_name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def clean_up(file)
        file.split(" - ")[1]
    end

    def self.new_by_filename(filename)
        artist_song = filename.split(" - ")
        artist = artist_song[0]
        new_song = artist_song[1]
        created = Song.new(new_song)
        created.artist = Artist.find_or_create_by_name(artist)
        created
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
        
        
        
    end



    
end