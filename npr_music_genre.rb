require 'httparty'

class NprGenre
    attr_reader :genres, :genre_list_words, :input, :genre_id

    def initialize(input)
      @genres = get_genre_array
      @input = input
      @genre_id = get_genre_id
    end

    private def get_genre_array
      unparsed_genre = HTTParty.get("http://api.npr.org/list?id=3018&output=json")
      genre_array = JSON.parse(unparsed_genre)['item']
    end

    def get_genre_id
      @genres.each do |genre|
        if @input == genre['title']['$text']
          return genre['id']
        end
      end
      "not found"
    end

    def genre_page
      "http://www.npr.org/music/genres/#{@input.downcase}/?ft=nprml&f=#{@genre_id}"
    end

    def article_link
      genre_page['list']['link'][1]['$text']
    end


end
