#!/usr/bin/env ruby
require 'rubygems'
require 'mp3info'
require 'sqlite3'

class Wolfman
  def initialize(time, dir)
    @time, @dir = time, dir
  end

  def index
    #create and index of songs from @dir
  end

  def create_record
    #assemble an mp3's filename/path and play time into a DB record
  end

  def random_song
    #select a random song from the database
  end

  def write_playlist(format)
    #write out the playlist in .pls or .m3u
  end
end
