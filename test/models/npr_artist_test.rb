require 'test_helper'
require './app/models/npr_genre.rb'
require './app/models/npr_artist.rb'

class NprArtist
  private def get_subcategory
    JSON.parse(File.open("./test/npr_artist.json").read)
  end
end

class NprTest < ActiveSupport::TestCase

  def test_get_artist_id
    abba = NprArtist.new("Abba")
    nobody = NprArtist.new("nobody")
    assert_equal '15394846', abba.artist_id
    assert_equal 'artist not found', nobody.artist_id
  end

end
