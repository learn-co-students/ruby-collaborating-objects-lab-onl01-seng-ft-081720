class MP3Importer
    attr_accessor :path


    def initialize(filepath)
        @path = filepath
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".."}
    end

    # def import 
    #     self.files.each do |file|
    #         song = Song.new_by_filename(file)
    #         Artist.all << song.artist unless Artist.all.include?(song.artist)
    #     end
    # end

    def import
        files.each{|file| Song.new_by_filename(file)}
    end


    # def import(list_of_filenames)
    #     # list_of_filenames.each{ |filename| Song.new_by_filename(filename) }
    # end

end