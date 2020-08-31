require 'pry'
class Song 
attr_accessor :name,:artist 
@@all = []
def initialize(name)
  @name = name 
  @@all << self 
end 

def self.all 
  @@all
end
 
 def self.new_by_filename(filename)
 x =  filename.split(" - ")
  song =  self.new(x[1])
   artist = Artist.find_or_create_by_name(x[0])
   song.artist = artist
   artist.add_song(song)
   song
end
 
 def artist_name=(name)
  x = Artist.find_or_create_by_name(name)
  song = self 
  song.artist = x 
  artist.add_song(song)
 end
end 