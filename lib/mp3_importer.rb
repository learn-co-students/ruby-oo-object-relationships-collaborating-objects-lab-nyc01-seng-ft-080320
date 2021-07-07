class MP3Importer

    attr_accessor :path

    @@files = []

    def initialize(path)
        @path = path
        @@files.push(self)
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        files.each do |f|
             Song.new_by_filename(f) 
        end
    end
end