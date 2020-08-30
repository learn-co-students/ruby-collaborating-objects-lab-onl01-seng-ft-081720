require 'pry'
class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        Song.new(song)
        @songs << song
    end
    
    def songs
        @songs
    end

    def self.find_or_create_by_name(artist)
        if self.all.find {|existing| existing.name == artist}
            existing_artist = self.all.find {|existing| existing.name == artist}
            existing_artist
        else
            Artist.new(artist)
        end
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end
end