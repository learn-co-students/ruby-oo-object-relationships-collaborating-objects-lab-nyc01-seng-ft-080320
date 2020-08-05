require 'pry'

class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    #I need to review this. Also the literal trimming of the file path seems odd to me.
    def files
        i = path.length
        Dir.glob("#{path}/*.mp3").map {|song_path| song_path[i+1..-1]}
    end

    #Fairly straight-forward once I figured out #files. 
    def import
        files.each {|file_name| Song.new_by_filename(file_name)}
    end

end

#binding.pry