require 'pry'
class Artist
attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|name| name.artist == self}
    end

    # def self.find_or_create_by_name(name)
    #     if self.all.detect {|artist| artist.name == name}
    #        self.all.detect {|artist| artist.name == name}
    #     else  
    #        new=self.new(name)
    #     end 
    # end

    def self.find_or_create_by_name(name)
        self.all.each do|artist| 
           if artist.name == name
              return artist
           end
        end   
   self.new(name)
   end

   def print_songs
        Song.all.each do |song|
           if song.artist == self 
                puts song.name
           end
        end
   end
   
end