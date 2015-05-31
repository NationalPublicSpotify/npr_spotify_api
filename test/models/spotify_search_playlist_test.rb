require 'test_helper'
require './app/models/spotify_search_playlist'

class SpotifySearchPlaylist

  private def get_path
    JSON.parse(File.open("./test/spotify_blues.json").read)
  end

end


class SpotifyTest < ActiveSupport::TestCase

  def test_spotify_playlist_genre
    blues = SpotifySearchPlaylist.new("Blues")
    assert_equal "http://open.spotify.com/user/sonymusicthelegacy/playlist/57zcG5rzNtI8DYrUz0nVsP", blues.playlist
  end


end
