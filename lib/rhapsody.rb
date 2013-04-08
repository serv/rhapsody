require 'open-uri'
require 'json'
require 'ostruct'
require 'extensions/strings'

module Rhapsody
  API_KEY = "gjyzdtfoCoOqonQCeThOGYHcU0oPVj3Q"

  class Artist
  end

  class Album
    attr_accessor :id, :name, :artist, :released, :type, :tags, :images

    def initialize(id, name, artist, released, type, tags, images)
      @id, @name, @artist, @released, @type, @tags, @images = id, name, artist, released, type, tags, images
    end

    # not working
    def self.new_releases
      url = "http://api.rhapsody.com/v0/albums/new?apikey=#{API_KEY}"
      json = JSON.parse(open(url).read)
    end

    def self.top(limit, offset)
      albums = []
      url = "http://api.rhapsody.com/v0/albums/top?apikey=#{API_KEY}"
      url.limit_offset!(limit, offset) if limit || offset
      begin
        json = JSON.parse(open(url).read)
        json.each do |element|
          album = Album.new(element["id"], element["name"], element["artist"], element["released"], element["type"], element["tags"], element["images"])
          albums << album
        end
      rescue Exception => e
        puts "Getting #{__method__} #{self.lowercase} is not currently working."
      end
      albums
    end
  end

  class Track
  end

  class Genre
  end

  class Authentication
  end

  class History
  end

  class Library
  end

  class Playlist
  end

  class Feature
  end

  class Popularity
  end

  class Search
  end
end
