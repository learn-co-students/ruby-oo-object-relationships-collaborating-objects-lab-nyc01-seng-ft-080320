require'pry'

class Artist

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |e|
            e.artist == self
        end
    end

    def add_song(track)
        track.artist = self
    end

    def self.find(art_name)
        self.all.find do |a|
            a.name == art_name
        end
    end

    def self.find_or_create_by_name(art_name)
        if self.find(art_name)
            self.find(art_name)
        else
            self.new(art_name)
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
      end

end