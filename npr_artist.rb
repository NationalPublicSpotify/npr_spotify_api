require 'httparty'

class NprArtist
  attr_reader :input, :subcategory

  def initialize(input)
    @input = input
    @subcategory = get_subcategory
    @artist_id = subcategory_iteration['subcategory']
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



  private def get_subcategory
    unparsed_artist = HTTParty.get("http://api.npr.org/list?id=3009&output=json")
    JSON.parse(unparsed_artist)
  end

  def artist_page
    HTTParty.get("http://api.npr.org/query?id=162810939&apiKey=#{ENV['NPR_KEY']}")
  end

end

abba = NprArtist.new("Milton Babbitt")

puts abba.subcategory_iteration
