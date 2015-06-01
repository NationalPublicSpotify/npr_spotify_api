# National Public Spotify

## Description
Rails API that links to Spotify and NPR to give the user articles and music related to the input the user provides.  The API takes in either an artist or genre and provides a link to related NPR music articles and a spotify playlist/image.  This is the first version of National Public Spotify.

###Features:
The following features include user input of either an artist or a playlist input.  The API displays the results in JSON format based on the following examples.<br>
<br>__NOTE:__ _All input must be capitalized upon entering it as a parameter._
### Artist
  `api/v1/music/artist?input= `
  <br>where input is an artist
  ####Sample Artist Output
  * `{
"article": "http://www.npr.org/sections/allsongs/2015/03/31/385536730/new-mix-ryan-adams-jamie-xx-the-civil-wars-joy-williams-more?ft=nprml&f=14953534"`<br>
`"image": "https://i.scdn.co/image/42508cf100c50faa7fbbeb962b0b18119bf24012"`
<br>
`"tracks": "https://open.spotify.com/artist/2qc41rNTtdLK0tV3mJn2Pm"
}`

### Playlist
  `api/v1/music/playlist?input= `
  <br>where input is a genre
  ####Sample Playlist Output

  * `{
"article": [
"http://www.npr.org/2015/05/16/406453568/in-hbos-bessie-queen-latifah-stars-as-empress-of-the-blues?ft=nprml&f=139998151",
"http://www.npr.org/sections/therecord/2015/05/15/406969376/b-b-king-and-the-majesty-of-the-blues?ft=nprml&f=139998151",
"http://www.npr.org/2015/05/15/406988156/b-b-king-on-life-plantation-living-and-his-droopy-drawers-sound?ft=nprml&f=139998151"
]`<br>
`"playlist": "http://open.spotify.com/user/spotify/playlist/339IIz2BoOlGAbE7pZ1nJp"
}`
