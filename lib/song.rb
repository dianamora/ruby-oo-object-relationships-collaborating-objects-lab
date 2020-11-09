require 'pry'
class Song
    attr_accessor :name, :artist
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

    def self.new_by_filename(filename) #have someone explain the following code, why did we also do artist
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name) 
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
  end

#   def artist_name=(name)
#     if (self.artist.nil?)
#       self.artist = Artist.new(name)
#     else
#       self.artist.name = name
#     end
#   end
#ABOVE is from the ReadMe. Is this the same as the artist_name= method right above it? Ask for reinforcement on calling the method
#originally written in artist.rb (find_or_create...name) in the song.rb file (relationship within the two)

end
   
