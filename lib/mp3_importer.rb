class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|file_name| file_name == "." || file_name == ".."}
    end

    def import 
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end

end