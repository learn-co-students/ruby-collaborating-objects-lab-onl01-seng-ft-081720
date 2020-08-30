
class Song
attr_accessor :name , :artist, :artist_name
@@all= []

    def initialize (name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename (file)
        song_name = file.split("-").map(&:strip)[1]
        artist_name = file.split("-").map(&:strip)[0]
        new_song= Song.new(song_name)
        new_song.artist= Artist.new(artist_name)
        new_song
    end

    def artist_name=(name)
        Artist.all.each do |artist| 
            if artist.name == name
                return self.artist = artist    
            end
        end
        self.artist= Artist.new(name)
    end

end 

