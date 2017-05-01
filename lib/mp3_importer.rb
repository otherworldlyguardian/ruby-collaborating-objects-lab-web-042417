require_relative "song"

class MP3Importer
  attr_reader :path
  attr_accessor :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(@path).each do |file|
      @files << file if file.end_with?(".mp3")
    end
    @files
  end

  def import
    files
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
