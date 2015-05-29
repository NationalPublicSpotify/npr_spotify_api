require 'httparty'

class SpotifySearchArtist
  attr_reader :artist, :input, :artist_img

  def initialize(input)
    @input = input
    @artist = parse_input
    @artist_img = path['artists']['items'][0]['images'][0]['url']
  end

  private def parse_input
    input_arr = input.split
    input_arr.join('%20')
  end

  private def path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{artist}&type=artist")
  end

end

blitzen_trapper = SpotifySearchArtist.new("Blitzen Trapper")
zac_brown_band = SpotifySearchArtist.new("Zac Brown Band")
puts blitzen_trapper.artist_img
puts zac_brown_band.artist_img

nobody = SpotifySearchArtist.new("blah")


puts nobody.artist_img
