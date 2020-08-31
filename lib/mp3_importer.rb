require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        Dir.children(self.path) 
    end

    def import
        self.files.each{ |filename| Song.new_by_filename(filename) }
    end
end