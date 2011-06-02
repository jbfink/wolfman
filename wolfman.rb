#!/usr/bin/env ruby
require 'rubygems'
require 'mp3info'
require 'sqlite3'

class Wolfman
  def initialize(time, path)
    #we assume time is given in minutes
    if File.exists?(path) && File.directory?(path)
      @time, @path = time, path
    else
      raise "Supplied directory does not exist or is not a directory"
    end
    @filled = 0
    @tracks = []
    @db = SQLite3::Database.new("wolfman.db")
    @db.execute("CREATE TABLE IF NOT EXISTS songs (title varchar(100), length integer)")
  end

  public
    def index
      #create an index of songs from @path
      Dir.foreach(@path) do |filename|
        Mp3Info.open(filename) do |mp3|
          @db.execute("INSERT INTO songs VALUES(?, ?)", mp3.tag1.title, mp3.length.ceil())
        end
      end
    end

    def fill_time
      while @filled < @time
        @tracks.push(random_song)
        @filled += random_song.length
      end
    end

    def write_playlist(format)
      #write out the playlist in .pls or .m3u
    end

  private
    def random_song
      # get new song with length <= (@time - @filled)
      # return song as mp3info object
    end
end
