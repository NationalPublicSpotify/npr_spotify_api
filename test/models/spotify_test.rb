require 'test_helper'
require 'json'
require './app/models/spotify_search_artist'
require './app/models/spotify_search_genre'
require './app/models/spotify_search_album'


class SpotifySearchArtist

  private def path
    JSON.parse(File.open("./test/blitzen_trapper.json").read)
  end

end

class SpotifySearchPlaylist

  private def get_path
    JSON.parse(File.open("spotify_blues.json").read)
  end

end


class SpotifyTest < ActiveSupport::TestCase

  def test_spotify_artist_search
    blitzen_trapper = SpotifySearchArtist.new("Blitzen Trapper")
    assert_equal "https://i.scdn.co/image/ae562d1a92412b1fb73cd5a5ab629f1a70e69660", blitzen_trapper.artist_img
  end

  def test_spotify_playlist_genre
  end


end
