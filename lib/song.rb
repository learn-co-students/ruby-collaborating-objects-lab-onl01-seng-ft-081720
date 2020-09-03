# class Song 
#   attr_accessor :name, :artist 

#   @@all = []

#   def initialize(name)
#     @name = name

#   end

# def self.new_by_filename(file_name)
#   song = file_name.split(" - ")[1]
#     artist = file_name.split(" - ")[0]
#     new_song = self.new(song)
#     new_song.artist_name = artist
#     new_song
#   end 

# def artist_name=(name)
#     self.artist = Artist.find_or_create_by_name(name)
#     artist.add_song(self)
#   end
 
# end
class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        #split the song and assign it to variables 
        artist, song = filename.split(" - ")
        # make a new song
        new_song = self.new(song)
        # assign the artist
        new_song.artist_name = artist
        # return our song
        new_song
    end

    def artist_name=(name)
        #find or create an artist instance
        self.artist = Artist.find_or_create_by_name(name)
        #assign it to the song attribute
        artist.add_song(self)
    end
    

end