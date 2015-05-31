require 'test_helper'
require './app/models/spotify_search_artist.rb'

class SpotifySearchArtist

  private def path
    JSON.parse(File.open("./test/spotify_blitzen_trapper.json").read)
  end

end

class SpotifyTest < ActiveSupport::TestCase

  def test_spotify_artist_search
    blitzen_trapper = SpotifySearchArtist.new("Blitzen Trapper")
    assert_equal "https://i.scdn.co/image/ae562d1a92412b1fb73cd5a5ab629f1a70e69660", blitzen_trapper.artist_img
  end

end
