require 'httparty'

class SpotifySearchPlaylist
  attr_reader :input

  def initialize(input)
    @input = input

  end




  def path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{input}&type=playlist")
  end


end


















#https://api.spotify.com/v1/search?q="doom metal"&type=playlist
