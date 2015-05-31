require 'test_helper'

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

end
