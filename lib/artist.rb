class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.filter do |obj|
            obj.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    # this is tricky because the condition was long
    def self.find_or_create_by_name(name)
        result = @@all.find {|artist| artist.name == name}
        if result
            result
        else
            artist = self.new(name)
            artist
        end
    end

    def print_songs
        arr = Song.all.filter { |obj| obj.artist == self }
        arr.each {|e| puts e.name }
    end

end