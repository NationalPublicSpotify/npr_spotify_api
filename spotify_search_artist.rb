require 'httparty'

class SpotifySearchArtist
  def initialize(input)
    @input = input
  end


  #url = https://api.spotify.com/v1/search?q=#{first_word}%20#{next_word}&type=artist
