require 'pry'
class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children(@path)
        #binding.pry
    end

    def import
        self.files.each { |filename| Song.new_by_filename(filename) }
    end

end

#inding.pry