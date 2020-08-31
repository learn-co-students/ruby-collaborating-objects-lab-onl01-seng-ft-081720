class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize (name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end  

    def add_song (song)
        Song.new(song)
        @songs << song
    end

    # def self.create(name)
    #     artist = self.new(name)
    #     # artist.name = name
    #     artist
    # end
    
    # def self.find(name)
    #     self.all.detect { |artist| artist.name == name }
    # end
    
    # def self.find_or_create_by_name(name)
    #     self.find(name) || self.create(name)
    # end
    
    def self.find_or_create_by_name(artist)
        if self.all.find{|ex_artist| ex_artist.name == artist}
        self.all.find{|ex_artist| ex_artist.name == artist}
        else
            Artist.new(artist)
        end
    end

    def print_songs
        songs.each {|song|
        puts song.name}
    end

end