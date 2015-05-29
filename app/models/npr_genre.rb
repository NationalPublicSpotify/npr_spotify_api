
class NprGenre
  attr_reader :genres, :stories, :input, :genre_id, :genre_link

  def initialize(input)
    @genres = get_genre_array['item']
    @input = input
    @genre_id = get_genre_id
    @genre_link = get_genre_link
    @stories = get_genre_stories
  end

  private def get_genre_array
    unparsed_genre = HTTParty.get("http://api.npr.org/list?id=3018&output=json")
    JSON.parse(unparsed_genre)
  end

  private def get_genre_link
    unparsed_genre_link = HTTParty.get("http://api.npr.org/query?id=#{genre_id}&output=JSON&apiKey=#{ENV['NPR_KEY']}")
    JSON.parse(unparsed_genre_link)
  end

  def get_genre_id
    genres.each do |genre|
      if input == genre['title']['$text']
        return genre['id']
      end
    end
    "not found"
  end

  private def get_genre_stories
    first_story = genre_link['list']['story'][0]['link'][0]['$text']
    second_story = genre_link['list']['story'][1]['link'][0]['$text']
    third_story = genre_link['list']['story'][2]['link'][0]['$text']
    [first_story, second_story, third_story]
  end

end
