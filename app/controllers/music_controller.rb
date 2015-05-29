
class MusicController < ApplicationController

  def show
    user_genre = NprGenre.new(params[:input])
    render json: user_genre.stories
  end


end
