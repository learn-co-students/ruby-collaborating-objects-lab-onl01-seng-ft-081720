class MP3Importer

  attr_accessor :name, :path
  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    path_contents = Dir["#{@path}/*.mp3"]
    path_contents.map do |file_name|
      @@all << file_name[21...file_name.size]
    end
    @@all
  end
  
 def import
    files.each {|song| Song.new_by_filename(song)}
  end
end