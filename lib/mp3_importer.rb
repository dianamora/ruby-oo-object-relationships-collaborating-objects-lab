require 'pry'

class MP3Importer
attr_reader :path 

def initialize(path)
    @path = path
end

def files #have someone explain this code
    #Dir.glob("#{@path}/*.mp3")
    #||= means if x is false or nil, set the value equal to whatever is after the = sign
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

def import #have someone explain the (f) at the end of this iteration
    files.each {|f| Song.new_by_filename(f)}
end

end

  
    
  
    