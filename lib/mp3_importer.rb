require 'pry'

class MP3Importer
    attr_accessor :path, :music 

    def initialize (filename)
        @path = filename
    end

    def files
        music_files = []
        @music = Dir.new(@path).entries
        music.each do |file|
            if file.end_with? (".mp3")
                music_files << file
            end
        end
        music_files
    end

    def import 
        @music = Dir.new(@path).entries
        music.each do |file|
            Song.new_by_filename (file)
        end
    end

end