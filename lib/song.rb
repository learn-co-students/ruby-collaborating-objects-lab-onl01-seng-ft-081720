class Song
    attr_accessor :name, :artist

    @@all=[]

    def initialize(name)
        @name=name
        @artist=artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
    alt = filename.split(" - ")
    song = self.new(alt[1])
    artist = Artist.find_or_create_by_name(alt[0])
    song.artist = artist
    artist.add_song(song)
    song
    end

    def artist_name=(name)
       self.artist = Artist.find_or_create_by_name(name)
       artist.add_song(self)
    end
    
end