require 'pry'
class Artist
    attr_accessor :name, :song#, :genre

    @@all = []

    def initialize(name)
        @name = name  #create artist name
        #@genre = genre
        save   #runs save
    end

    def save # saves Artist instance in .all array
        @@all << self
    end
    
    def self.all #calls all Artists in @@all
        @@all
    end
    
    def songs #returns all Song instances that have that artist name
        Song.all.select {|name| name.artist == self}
    end

    def add_song(song)
        song.artist = self
    end
#find or create AN ARTIST!!! by name
#Either way, the return value of the method will be an 
#instance of an artist with the name attribute filled out.
    def self.find_or_create_by_name(name) 
        the_artist = self.all.find {|artists| artists.name == name}   
        if the_artist
            return the_artist
        else
            name = Artist.new(name)
        end
    end 
    #search through all Artists for matching names
    #if that search is nil, create a new Artist, 
    #else, return Artist
    def print_songs
      songs.each {|a_song| puts "#{a_song.name}"}
    end

end