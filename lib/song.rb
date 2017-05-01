require_relative "artist"

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    split = file.split(" - ")
    song = Song.new(split[1])
    song.artist = Artist.find_or_create_by_name(split[0])
    song.artist.add_song(self)
    song
  end

end
