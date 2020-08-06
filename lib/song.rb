class Song

    @@all = [];
    attr_accessor :name, :artist;

    def initialize(name)
        @name = name;
        @@all << self;

    end

    def self.all
        @@all;
    end
    
    # example file from rspec 'Michael Jackson - Black or White - pop.mp3'
    # this is really cool because we are able to use the class methods from artist to save sooooo much work
    def self.new_by_filename(file)
        title = file.split(' - ')[1];
        artist_name = file.split(' - ')[0]
        song = Song.new(title);
        artist = Artist.find_or_create_by_name(artist_name);
        artist.add_song(song);
        song;
    end

    def artist_name= (name)
        newArtist = Artist.find_or_create_by_name(name);
        self.artist = newArtist;
    end
       
end