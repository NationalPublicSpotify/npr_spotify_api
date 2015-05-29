
class SpotifySearchArtist
  attr_reader :artist, :input, :artist_img

  def initialize(input)
    @input = input
    @artist = parse_input
    @artist_img = get_artist_image
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

  private def parse_input
    input_arr = input.split
    input_arr.join('%20')
  end

  private def path
    HTTParty.get("https://api.spotify.com/v1/search?q=#{artist}&type=artist")
  end

end