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
    def self.find_or_create_by_name(name) 
        if  self.all.select {|artists| artists.name != name}
            name = Artist.new(name)
        else
            name
            #self.all.select {|artists| artists.name == name}
        end
    end #search through all Artists for matching names
    #if that search is nil, create a new Artist, 
    #else, return Artist

    # def find_or_create_by_name(name)
    #     if (self.name.nil?)
    #     self.name = Artist.new(name)
    #     else
    #         self.name = name
    #     end
    
end
