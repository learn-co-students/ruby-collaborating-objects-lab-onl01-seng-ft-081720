require 'pry'
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    files.each {|song| Song.new_by_filename(song)}
  end

  # def import
  #   imported_files = self.files
  #   imported_files.each do |file|
  #     new_song = Song.new_by_filename(file)
  #   end
  # end
# binding.pry
end