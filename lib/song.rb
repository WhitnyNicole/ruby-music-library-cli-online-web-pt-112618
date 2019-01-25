<<<<<<< HEAD
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = [] #is initialized as an empty array

  def initialize(name, artist = nil, genre = nil)
    #accepts a name for the new song
    @name = name

    if genre
      self.genre = genre
    end

    if artist
      self.artist = artist
    end

=======
require 'pry'
class Song
  # extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize (name, artist=nil, genre=nil)
    @@all << self
    @name = name
    @artist = artist
    self.artist = artist if artist != nil
    @genre = genre
    self.genre = genre if genre != nil
>>>>>>> 8fcdab011ae3d6cee526c3981e37d853e9439aa6
  end

  def artist=(artist)
    @artist = artist
<<<<<<< HEAD
    artist.add_song(self)
=======
    self.artist.add_song(self)
>>>>>>> 8fcdab011ae3d6cee526c3981e37d853e9439aa6
  end

  def genre=(genre)
    @genre = genre
<<<<<<< HEAD
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all #returns the class variable @@all
    @@all
  end

  def save #adds the Song instance to the @@all class variable
    @@all << self
  end

  def self.destroy_all #resets the @@all class variable to an empty array
    @@all.clear
  end

  def self.create(song) # initializes and saves the song
    self.new(song).tap {|name|
    name.save}
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    #returns (does not recreate) an existing song with the provided name if one exists in @@all. invokes .find_by_name instead of re-coding the same functionality
    #creates a song if an existing match is not found.  invokes .create instead of re-coding the same functionality
    self.find_by_name(song_name) ||    self.create(song_name)
  end

  def self.new_from_filename(filename) #initiates a new Song object based on a provided filename
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename) # same thing as .new_from_filename, but also saves the newly-created song to @@all class variable.
    @@all << self.new_from_filename(filename)

  #  parts = filename.split(" - ")
  #  artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3","")

#    artist = Artist.find_or_create_by_name(artist_name)
#    genre = Genre.find_or_create_by_name(genre_name)
#    self.create(song_name, artist, genre)
  end

end
=======
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create (name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
 end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")

    song_artist = Artist.find_or_create_by_name(filename_array[0])
    song_genre = Genre.find_or_create_by_name(filename_array[2].split(".mp3")[0])
    song = Song.new(filename_array[1],song_artist,song_genre)

  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end 
>>>>>>> 8fcdab011ae3d6cee526c3981e37d853e9439aa6
