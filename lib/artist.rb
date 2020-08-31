require 'pry'

# creating the artist
# or finding the instance of the artist

class Artist
   
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
    # name is a variable
        self.all.detect {|artist| artist.name == name} || Artist.new(name)

       

    end

    def print_songs
        @songs.each {|song| puts song.name}


    end






end