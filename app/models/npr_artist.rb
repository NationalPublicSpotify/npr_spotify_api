
class NprArtist
  attr_reader :input, :subcategory, :artist_id, :artist_page

  def initialize(input)
    @input = input
    @subcategory = get_subcategory['subcategory']
    @artist_id = subcategory_iteration
    @artist_page = get_artist_page
  end

  def subcategory_iteration
    subcategory.each do |hash_by_letter|
      hash_by_letter['item'].each do |i|
        return i['id'] if input == i['title']['$text']
      end
    end
    "artist not found"
  end

  def get_articles
    artist_page['nprml']['list']['story'][0]['link'][0]['__content__']
  end

  private def get_subcategory
    unparsed_artist = HTTParty.get("http://api.npr.org/list?id=3009&output=json")
    JSON.parse(unparsed_artist)
  end

  def get_artist_page
    HTTParty.get("http://api.npr.org/query?id=#{artist_id}&apiKey=#{ENV['NPR_KEY']}")
  end

end
