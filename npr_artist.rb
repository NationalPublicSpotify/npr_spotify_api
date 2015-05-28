require 'httparty'

class NprArtist
  attr_reader :input, :subcategory

  def initialize(input)
    @input = input
    @subcategory = get_subcategory
    @artist_id = subcategory_iteration
  end

  def subcategory_iteration
    subcategory.each do |hash_by_letter|
      hash_by_letter['item'].each do |i|
        if input == i['title']['$text']
          return i['id']
        end
      end
    end
    "artist not found"
  end



  def get_subcategory
    unparsed_artist = HTTParty.get("http://api.npr.org/list?id=3009&output=json")
    JSON.parse(unparsed_artist)['subcategory']
  end

  def artist_page
    "http://api.npr.org/query?id=162810939&apiKey=MDA1MTEzODY5MDEyOTc4NzIzODU0MTAxNA001"
  end

end

abba = NprArtist.new("Milton Babbitt")

puts abba.subcategory_iteration
