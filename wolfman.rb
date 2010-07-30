#!/usr/bin/env ruby
require 'rubygems'
require 'mp3info'
require 'sqlite3'

class Wolfman
  def initialize(time, dir)
    #we assume time is given in minutes
    if File.exists?(dir) && File.directory?(dir)
      @time, @dir = time, dir
    else
      raise "Supplied directory does not exist or is not a directory"
    end
    @filled = 0
    @tracks = []
  end

  public
    def index
      #create and index of songs from @dir
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
    def create_record
      #assemble an mp3's filename/path and play time into a DB record
    end

    def random_song
      # get new song with length <= (@time - @filled)
      # return song as mp3info object
    end
end
