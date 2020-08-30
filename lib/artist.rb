class Artist 
  attr_accessor :name 
  attr_reader :songs
  
  @@all = []
  
   def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  #returns all of the items in the @@all array 
  def self.all
    @@all
  end 
  
  def add_song(song)
    @songs << song
  end
  
   def save
    @@all << self
  end

  def songs
    @songs
  end


  def self.find_or_create_by_name(name)
    #self.all returns all of the saved artist
    #.detect iterates through that Array
    #if we find a match it return true. if not, then it will create a new one. 
    self.all.detect {|artist| artist.name == name} || Artist.new(name)
  end
  
  def print_songs
    songs.each {|song| puts song.name}
  end 
end 