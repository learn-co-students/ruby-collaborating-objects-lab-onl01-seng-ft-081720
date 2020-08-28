class MP3Importer
    attr_accessor :path
    

    
    def initialize(file_path)
        @path = file_path
        @files = Dir.entries(file_path).select {|f| !File.directory? f}
    end

    def files
        @files
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end