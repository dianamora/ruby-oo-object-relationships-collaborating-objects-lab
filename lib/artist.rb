require 'pry'

class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
       save
    end

    def save
        @@all << self
    end

    def self.all
        @@all 
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end 

    def add_song(song)
        # song = Song.new => why don't we need this and only the following code? 
        song.artist = self
    end

    def self.find_or_create_by_name(name) #have someone explain the following code
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name) #why do we need this code in order to make the above work? Can't it all be in one method? should this code come befoer the other?
        self.all.find {|artist| artist.name == name }
      end
    

    def print_songs
        songs.each {|song| puts song.name}
    end

end

# Artist
#   #initialize with #name
#     accepts a name for the artist
#   #name=
#     sets the artist name
#   .all
#     returns all existing Artist instances
#   #songs
#     lists all songs that belong to this artist
#   #add_song
#     keeps track of an artist's songs
#   .find_or_create_by_name
#     always returns an Artist instance
#     finds or creates an artist by name maintaining uniqueness of objects by name property
#     Creates new instance of Artist if none exist
#   #print_songs
#     lists all of the artist's songs

# MP3Importer
#   #initialize
#     accepts a file path to parse mp3 files from
#   #files
#     loads all the mp3 files in the path directory
#     normalizes the filename to just the mp3 filename with no path
#   #import
#     imports the files into the library by creating songs from a filename

# Song
#   #initialize with a name
#     accepts a name for the song and makes it accessible through an attribute accessor
#   #name=
#     sets the song name
#   #artist=
#     sets the artist object to belong to the song
#   .all
#     returns all existing Song instances
#   .new_by_filename
#     creates a new instance of a song from the file that's passed
#     associates new song instance with the artist from the filename
#   #artist_name=
#     accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute



  
   
   
  