require_relative './song'
require 'pry'

class MP3Importer

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end
  
  def files
    @files = Dir.glob("*.mp3", base: @path)
  end 

  def import 
    self.files.each{ |file| Song.new_by_filename(file) }
  end 

end   


# test_music_path = "./spec/fixtures/mp3s"
# files = Dir.glob("#{test_music_path}/*.mp3")

# files2 = Dir.glob("#{test_music_path}/*.mp3").collect{ |f| f.slice(-"#{test_music_path}/") }

# files3 = Dir.glob("*.mp3", base: test_music_path)

# binding.pry 
