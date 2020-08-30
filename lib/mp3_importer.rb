class MP3Importer
attr_accessor :path

    def initialize (file)
        @path=file
    end

    def files
        Dir["#{self.path}/*.mp3"].select{ |f| File.file? f }.map{ |f| File.basename f } 
    end

    def import
        self.files.each {|song| Song.new_by_filename(song)}
    end
end

