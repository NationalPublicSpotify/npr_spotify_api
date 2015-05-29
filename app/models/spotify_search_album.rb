
class SpotifyAlbumSearch
  attr_reader :input, :album

  def initialize(input)
    @input = input
    @album = get_album
  end

  private def get_album
    if path['albums']['items'] != []
      path['albums']['items'][0]['external_urls']["spotify"]
    else
      "album not located"
    end
  end


  private def path
    HTTParty.get("https://api.spotify.com/v1/search?q=album:#{input}&type=album")
  end

end
