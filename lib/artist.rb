# class Artist

#   attr_accessor :name
#   attr_reader :songs

#   @@all = []

#   def initialize(name)
#     @name = name
#     @songs = []
#     @@all << self
#   end

#   def add_song(song)
#     @songs << song
#   end

#   def save
#     @@all << self
#   end

#   def self.all
#     @@all
#   end

#   def self.find_or_create_by_name(name)
#     artist_object = Artist.all.find do |artist_name|
#       artist_name.name == name
#     end
#     if artist_object
#       artist_object
#     else
#       Artist.new(name)

#     end
#   end

#   def print_songs
#     @songs.map do |song_object|
#       puts song_object.name
#     end
#   end

# end

class Artist
    @@all = []

    attr_accessor :name, :songs

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
        Song.all.select { | song | song.artist == self }
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find { | artist | artist.name == name }
    end

    def print_songs
        songs.each { | song | puts song.name }
    end



end