require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        array = filename.split(" - ")
        song = self.new(array[1])
        artist = Artist.find_or_create_by_name(array[0])
        song.artist = artist
        #artist.song = song WHYYYYYY NOT THIS WAY
        #binding.pry
        song
    end

    def artist_name=(a_name)
        artist = Artist.find_or_create_by_name(a_name)
        @artist = artist
    end
    #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
    #Michael Jackson - Black or White - pop.mp3
end

#binding.pry
#Song.new_by_filename("Michael Jackson - Black or White - pop.mp3")