
class SpotifySearchArtist
  attr_reader :artist, :input, :artist_img, :tracks, :market

  def initialize(input)
    @input = input
    @artist_img = get_artist_image
    @tracks = get_artist_tracks
  end

  def get_artist_image
    if path['artists']['items'] == []
      "Invalid artist"
    elsif path['artists']['items'][0]['images'] == []
      "This artist has no images"
    else
      path['artists']['items'][0]['images'][0]['url']
    end
  end

  def get_artist_tracks
    if path['artists']['items'] == []
      "Invalid artist"
    elsif path['artists']['items'][0]['images'] == []
      "This artist has no tracks"
    else
      path['artists']['items'][0]['external_urls']['spotify']
    end
  end

  # private def parse_input
  #   input_arr = input.split
  #   input_arr.join('%20')
  # end

  private def path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{input}&type=artist")
  end

end
