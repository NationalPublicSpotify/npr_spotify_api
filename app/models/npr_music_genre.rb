
class NprGenre
    attr_reader :genres, :genre_page, :input, :genre_id

    def initialize(input)
      @genres = get_genre_array['item']
      @input = input
      @genre_id = get_genre_id
      @genre_page = genre_page
    end

    private def get_genre_array
      unparsed_genre = HTTParty.get("http://api.npr.org/list?id=3018&output=json")
      genre_array = JSON.parse(unparsed_genre)
    end

    def get_genre_id
      @genres.each do |genre|
        if @input == genre['title']['$text']
          return genre['id']
        end
      end
      "not found"
    end

    private def genre_page
      HTTParty.get("http://www.npr.org/music/genres/#{@input.downcase}/?ft=nprml&f=#{@genre_id}")
    end

end
