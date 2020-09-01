class Artist
   attr_accessor :name, :songs

   @@all = []

   def initialize(name)
      @name = name
      @songs = []
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
      Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
       self.all.detect {|artist| artist.name == name} || Artist.new(name)

    end

    def print_songs
        Song.all.each do |song|
            if song.artist == self 
                 puts song.name
            end
       end
    end

end
