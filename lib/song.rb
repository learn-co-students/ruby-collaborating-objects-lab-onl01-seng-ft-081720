
class Song

    @@all = []

    attr_accessor :name, :artist
  
    def initialize(name)
      @name = name
      save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
      end
  
    def self.new_by_filename(filename)
        song_artist = filename.split(" - ")[0]
        song_title = filename.split(" - ")[1]
        song = Song.new(song_title)
        # artist = Artist.find_or_create_by_name(song_artist)
        song.artist_name = song_artist
        # artist.add_song(song)
        song
    end

  
    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end
  
  end
