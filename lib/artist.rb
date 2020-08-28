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
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        if self.all.detect {|artist| artist.name == artist_name}
            self.all.detect {|artist| artist.name == artist_name}
        else
           Artist.new(artist_name)
        end
    end

    def print_songs
        Song.all.select {|song| song.artist == self}.each {|song| puts song.name}
    end

end