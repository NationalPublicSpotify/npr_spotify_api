
class SpotifySearchPlaylist
  attr_reader :input, :playlist

  def initialize(input)
    @input = input
    @playlist = get_playlist
  end

  private def get_playlist
    if get_path['playlists']['items'] != []
      get_path['playlists']['items'][(0..19).to_a.sample]['external_urls']['spotify']
    else
      'no genre available'
    end
  end


  def get_path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{input}&type=playlist")
  end


end
