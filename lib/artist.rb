class Artist
    attr_accessor :name

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
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(file) #this is not a file. It is a string of artist's name
        array = @@all.select{|art| art.name == file}
        array.length > 0 ? array[0] : Artist.new(file)
    end

    def print_songs
        self.songs.each{|song| puts song.name}
    end
end