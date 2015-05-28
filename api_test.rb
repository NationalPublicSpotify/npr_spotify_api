require 'minitest/autorun'
require 'minitest/pride'
require 'json'

#require './artist.json'
# require './genre.json'

require './npr_music_genre'
# require './npr_artist'

# class NprArtist
#   private def get_subcategory
#     JSON.parse(File.open("artist.json").read)
#   end
# end

# class NprGenre
#   private def get_genre_array
#     JSON.parse(File.open("genre.json").read)
#   end
# end


class NprTest < Minitest::Test
  def test_get_genre_id
    jazz = NprGenre.new("Jazz")

    assert_equal "10002", jazz.genre_id
  end


end
