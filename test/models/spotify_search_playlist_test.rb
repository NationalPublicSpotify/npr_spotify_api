require 'test_helper'
require './app/models/spotify_search_playlist'

class SpotifySearchPlaylist

  def get_path
    JSON.parse(File.open("./test/spotify_blues.json").read)
  end

end


class SpotifyTest < ActiveSupport::TestCase

  def test_spotify_playlist_genre
    blues = SpotifySearchPlaylist.new("Blues")
    assert_equal "https://api.spotify.com/v1/search?query=blues&offset=0&limit=20&type=playlist", blues.get_path['playlists']['href']
  end


end
