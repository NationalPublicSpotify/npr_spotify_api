
class MusicController < ApplicationController

  def playlist
    playlist_hash = {}
    spotify_playlist = SpotifySearchPlaylist.new(params[:input])
    npr_article = NprGenre.new(params[:input])

    playlist_hash[:article] = npr_article.stories
    playlist_hash[:playlist] = spotify_playlist.playlist
    render json: playlist_hash
  end

  def artist
    artist_hash = {}
    spotify_artist = SpotifySearchArtist.new(params[:input])
    npr_artist = NprArtist.new(params[:input])

    artist_hash[:article] = npr_artist.get_articles
    artist_hash[:image] = spotify_artist.artist_img
    artist_hash[:tracks] = spotify_artist.tracks

    render json: artist_hash
  end

end
