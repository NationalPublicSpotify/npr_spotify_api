
class NprArtist
  attr_reader :input, :subcategory, :artist_id

  def initialize(input)
    @input = input
    @subcategory = get_subcategory['subcategory']
    @artist_id = subcategory_iteration
  end

  def subcategory_iteration
    subcategory.each do |hash_by_letter|
      hash_by_letter['item'].each do |i|
        return i['id'] if input == i['title']['$text']
      end
    end
    "artist not found"
  end



  private def get_subcategory
    unparsed_artist = HTTParty.get("http://api.npr.org/list?id=3009&output=json")
    JSON.parse(unparsed_artist)
  end

  def artist_page
    HTTParty.get("http://api.npr.org/query?id=162810939&apiKey=#{ENV['NPR_KEY']}")
  end

end
