require 'pry'
class MP3Importer
    attr_accessor :path
    attr_reader :files
    def initialize(path)
        # binding.pry
        @path = path
        @files = Dir.glob("*.mp3", base: path)
    end

    def import
        @files.each do |song_name|
            Song.new_by_filename(song_name)
        end
    end
end