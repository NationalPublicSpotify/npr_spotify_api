require 'httparty'

class SpotifySearchPlaylist
  attr_reader :input, :path

  def initialize(input)
    @input = input
    @path = get_path['playlists']['items'][0]['external_urls']['spotify']
  end

  private def get_path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{input}&type=playlist")
  end


end

death_metal = SpotifySearchPlaylist.new('death metal')
puts death_metal.path
