class MP3Importer
    attr_reader :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      array = path.length
      Dir.glob("#{path}/*.mp3").map {|song_path|song_path[array+1..-1]}     ## documentation for Dir.glob( pattern, [flags], [base: path] ) → array
    end
  
    def import
      files.each{|file| Song.new_by_filename(file)}
    end
  end