class Artist

    @@all = [];

    attr_accessor :name
    def initialize(name)
        @name = name;
        @@all.push(self);

    end

    def self.all
        @@all;
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find {|artist| artist.name == name};

        if artist
            return artist
        else
            artist = Artist.new(name);
        end
    end

    def add_song(song)
        song.artist = self;
        songs << song;
    end

    def songs
        Song.all.filter {|song| song.artist == self}
    end

    def print_songs
        artist_songs = self.songs;
        artist_names =artist_songs.map{|songsObject| songsObject.name}
        puts artist_names;
        
    end
end