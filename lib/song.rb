require 'pry'
class Song
    attr_accessor :artist, :name, :genre

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

    def self.new_by_filename(filename)
        split_file = filename.split(/\s-\s|\.mp3/)
        song = self.new(split_file[1])
        song.artist = Artist.find_or_create_by_name(split_file[0]) 
        # @genre = split_file[2]
        song
    end

    def artist_name=(artist_name)
        @artist = Artist.find_or_create_by_name(artist_name)
    end
end