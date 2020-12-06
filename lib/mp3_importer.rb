require 'pry'
class MP3Importer
        attr_accessor :path

        @@library = []

        #test_music_path = "./spec/fixtures/mp3s"
    def initialize(path)
        @path = path
    
    end
    #I need to take/read/move the 4 .mp3 files in ./spec/fixtures/mp3s
    #and rename/import that as 4 strings. 

    # file_names = ./spec/fixtures/mp3s
    # file_names.delete_suffix(".mp3").split(" - ")

    #https://www.rubyguides.com/2020/02/ruby-dir/
    def files
        song_files = Dir.entries(@path)
        song_files.select {|s| s.include?("mp3")}
    end
    # file_data = File.read("user.txt").split
    # File.foreach("users.txt") { |line| puts line }

    def import
        files.each {|f| @@library << Song.new_by_filename(f)}
        
    end
end