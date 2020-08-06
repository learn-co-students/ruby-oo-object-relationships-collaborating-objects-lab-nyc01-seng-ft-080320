class MP3Importer
    attr_reader :path, :files
   
    def initialize(filepath)
        @path = filepath 
        
    end
    
    
    
    
    def files
        clean_up = Proc.new() {|file| file.split("/")[-1] }
        ammended_path = @path + "/*"   
        files = Dir[ammended_path]
        files.map(&clean_up)
    end

    def import
        new_songs = files
        new_songs.each do |song|
            Song.new_by_filename(song)
        end
    end

    


end