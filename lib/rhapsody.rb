require 'open-uri'
require 'json'
require 'ostruct'
require 'extensions/strings'

module Rhapsody
  API_KEY = "FF3m3Ux0fES32FFvc08QMY1xRH6XGOgn"

  class Artist
    attr_accessor :id, :name, :genre

    def initialize(arguments)
      arguments.each do |key, value|
        if key == "genre"
          instance_variable_set("@#{key}", Genre.new(value))
        else
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end

  class Album
    attr_accessor :id, :name, :artist, :released, :tags, :label, :discs, :genre, :type, :copyright, :images, :tracks

    def initialize(arguments)
      arguments.each do |key, value|
        if key == "artist"
          instance_variable_set("@#{key}", Artist.new(value))
        elsif key == "tracks"
          instance_variable_set("@#{key}", value.map.each {|element| Track.new(element)})
        elsif key == "genre"
          instance_variable_set("@#{key}", Genre.new(value))
        elsif key == "type"
          instance_variable_set("@#{key}", Type.new(value))
        elsif key == "images"
          instance_variable_set("@#{key}", value.map.each {|element| Image.new(element)})
        else
          instance_variable_set("@#{key}", value)
        end
      end
    end

    def self.new_releases
      url = "http://api.rhapsody.com/v0/albums/new?apikey=#{API_KEY}"

      begin
        json = JSON.parse(open(url).read)
        json.map do |album|
          Album.new(album)
        end
      rescue
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end

    def self.top(limit, offset)
      albums = []
      url = "http://api.rhapsody.com/v0/albums/top?apikey=#{API_KEY}"
      url.limit_offset!(limit, offset) if limit || offset
      begin
        json = JSON.parse(open(url).read)
        json.each do |element|
          album = Album.new({
            :id => element["id"],
            :name => element["name"],
            :artist => Artist.new(element["artist"]),
            :released => element["released"],
            :type => element["type"],
            :tags => element["tags"],
            :images => element["images"]
          })
          albums << album
        end
        albums
      rescue Exception => e
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end

    def self.album_details(id)
      url = "http://api.rhapsody.com/v0/albums/#{id}?apikey=#{API_KEY}"
      begin
        json = JSON.parse(open(url).read)
        album = Album.new(json)
      rescue Exception => e
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end

    def self.album_tracks(id)
      url = "http://api.rhapsody.com/v0/albums/#{id}/tracks?apikey=#{API_KEY}"
      begin
        json = JSON.parse(open(url).read)
        json.map do |track|
          Track.new(track)
        end
      rescue
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end

    def self.album_images(id)
      url = "http://api.rhapsody.com/v0/albums/#{id}/images?apikey=#{API_KEY}"
      begin
        json = JSON.parse(open(url).read)
        json.map do |image|
          Image.new(image)
        end
      rescue
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end

    def self.similar_albums(id)
      url = "http://api.rhapsody.com/v0/albums/#{id}/similar?apikey=#{API_KEY}"
      begin
        json = JSON.parse(open(url).read)
        json.map do |album|
          Album.new(album)
        end
      rescue
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end

    def self.album_reviews(id)
      url = "http://api.rhapsody.com/v0/albums/#{id}/reviews?apikey=#{API_KEY}"
      begin
        json = JSON.parse(open(url).read)
        json.map do |review|
          Review.new(review)
        end
      rescue
        puts "Getting #{__method__} #{self.name} is not currently working."
      end
    end
  end

  class Track
    attr_accessor :id, :name, :artist, :album, :genre, :duration, :sample

    def initialize(arguments)
      arguments.each do |key, value|
        if key == "artist"
          instance_variable_set("@#{key}", Artist.new(value))
        elsif key == "album"
          instance_variable_set("@#{key}", Album.new(value))
        elsif key == "genre"
          instance_variable_set("@#{key}", Genre.new(value))
        else
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end

  class Genre
    attr_accessor :id

    def initialize(arguments)
      arguments.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end

  class Image
    attr_accessor :width, :height, :url

    def initialize(arguments)
      arguments.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
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

  class Review
    attr_accessor :id, :author, :body

    def initialize(arguments)
      arguments.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end

  class Search
  end

  class Type
    attr_accessor :id, :name

    def initialize(arguments)
      arguments.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
