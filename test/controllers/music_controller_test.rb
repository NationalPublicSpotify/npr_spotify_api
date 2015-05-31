require 'test_helper'

class MusicControllerTest < ActionController::TestCase
  test "should get playlist" do
    get :playlist
    assert :response
  end

  test "should get artist" do
    get :artist
    assert :response
  end
end
