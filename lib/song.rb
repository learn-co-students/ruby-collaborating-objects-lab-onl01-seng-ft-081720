# require "pry"
class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        song = file_name.chomp(".mp3").split(" - ")
        new_artist = Artist.find_or_create_by_name(song[0])
        new_song = Song.new(song[1])
        new_artist.add_song(new_song)
        new_song

        # new_instance = Song.new(song[1])
        # new_instance.artist = song[0]
        # new_instance
    end

    def artist_name=(name)
        Artist.find_or_create_by_name(name).add_song(self)
    end
end