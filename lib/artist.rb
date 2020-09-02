class Artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def name
        @name
    end
    
    def name=(name)
        @name = name
    end

    def self.all
        @@all
    end

    def add_song

    end

    def songs
        
    end

    def self.find_or_create_by_name
        artist.name if artist
    end
end