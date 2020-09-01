# Song
#   #initialize with a name
#     accepts a name for the song and makes it accessible through an attribute accessor (FAILED - 14)
#   #name=
#     sets the song name (FAILED - 15)
#   #artist=
#     sets the artist object to belong to the song (FAILED - 16)
#   .all
#     returns all existing Song instances (FAILED - 17)
#   .new_by_filename
#     creates a new instance of a song from the file that's passed (FAILED - 18)
#     associates new song instance with the artist from the filename (FAILED - 19)
#   #artist_name=
#     accepts an artist's name, finds or creates an Artist instance and assigns it 
#     to the Song's artist attribute (FAILED - 20)
require 'pry'

class Song
    attr_accessor :name, :artist
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
      artist, song = filename.split(" - ")
      new_song = self.new(song)
      new_song.artist_name = artist
      new_song
    end
  
    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end
  end