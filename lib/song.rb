class Song    
  
  attr_accessor :name, :artist  

  @@all = []    

  def initialize(name)        
    @name = name         
    @@all << self    
  end    

  def self.all        
    @@all    
  end   

  def self.new_by_filename(file_name)        
    array = file_name.split(' - ')         
    x = Song.new(array[1])        
    x.artist_name = array[0]        
    x    
  end    

  def artist_name=(string)       
     x = Artist.find_or_create_by_name(string)        
     self.artist = x    
     end
  end