class MP3Importer

    attr_accessor :path;
    attr_writer :files;

    def initialize(file_path)
        @path = file_path;
    end
    
    # Hey i looked at the solution branch for mp3.rb to see what method is used import file_names as soon as I saw Dir.glob I closed it
    # and looked up seperate documentation for it here: https://www.rubyguides.com/2020/02/ruby-dir/
    # scrolled down to Listing files and directories with Pattern matching


    
#   describe '#files' do
#   it 'loads all the mp3 files in the path directory' do
#     test_music_path = "./spec/fixtures/mp3s"
#     music_importer = MP3Importer.new(test_music_path)
#     expect(music_importer.files.size).to eq(4)
    
# so i think the * is saying get me all that finishes with .mp3 and I manually put the path but I think u can
    # u can also pass in the @path and use #{path} with string interpolation

    # I put a puts in the collect at first and got:
      #files
# ./spec/fixtures/mp3s/Real Estate - It's Real - hip-hop.mp3
# ./spec/fixtures/mp3s/Thundercat - For Love I Come - dance.mp3
# ./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3
#so I think we can map by removing the .spec/fixtures...if we split on '/' we want index 4
    
    def files()
        @files = Dir.glob("./spec/fixtures/mp3s/*.mp3").map{|file| file.split('/')[4]}
    end

    def import
        # Song.new_by_filename(self.files) lol i was like wtf why wont this work....well files is an array sooooo
        self.files.each {|file| Song.new_by_filename(file)}
    end
end