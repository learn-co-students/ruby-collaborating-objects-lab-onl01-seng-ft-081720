require 'pry'
class Artist
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
       @songs = Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        found = self.all.find {|artist| artist.name = artist_name}
        if found !=nil
            found
        else 
            artist_name = Artist.new(artist_name)
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end