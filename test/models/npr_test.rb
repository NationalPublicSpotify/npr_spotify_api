require 'test_helper'
require './app/models/npr_music_genre.rb'
require './app/models/npr_artist.rb'

class NprArtist
  private def get_subcategory
    JSON.parse(File.open("./test/npr_artist.json").read)
  end
end

class NprGenre
  private def get_genre_array
    JSON.parse(File.open("./test/npr_genre.json").read)
  end
end

class NprTest < ActiveSupport::TestCase

  def test_get_genre_id
    jazz = NprGenre.new("Jazz")
    beethoven = NprGenre.new("Beethoven")
    assert_equal '10002', jazz.genre_id
    assert_equal "not found", beethoven.genre_id
  end

  def test_get_artist_id
    abba = NprArtist.new("Abba")
    nobody = NprArtist.new("nobody")
    assert_equal '15394846', abba.artist_id
    assert_equal 'artist not found', nobody.artist_id
  end

end
