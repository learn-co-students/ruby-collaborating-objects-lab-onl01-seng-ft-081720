class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = nil
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_artist = filename.split(" - ")[0]
        song_title = filename.split(" - ")[1]
        song = Song.new(song_title)
        artist = Artist.find_or_create_by_name(song_artist)
        song.artist = artist
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end
end