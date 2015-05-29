
class SpotifySearchPlaylist
  attr_reader :input, :playlist

  def initialize(input)
    @input = input
    @playlist = get_genre_playlist
  end

  private def get_genre_playlist
    if get_path['playlists']['items'] != []
      get_path['playlists']['items'][0]['external_urls']['spotify']
    else
      'no genre available'
    end
  end

  private def get_path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{input}&type=playlist")
  end


end
