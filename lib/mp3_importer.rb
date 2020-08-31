require 'pry'


class MP3Importer
   attr_accessor :path

   def initialize(path)
    @path = path
   end

   # parse filenames and then send to the Song class
   def files
      @files = Dir.entries(@path)
      @files.delete_if {|file| file == "." || file == ".."}


      # binding.pry 
   end

   def import 
      self.files.each do |file|

         song = Song.new_by_filename(file)
         Artist.all << song
      end


   end






end