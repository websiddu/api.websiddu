class MusicController < ApplicationController
  require 'net/http'

  def index
    api_key = "3175aeaf3f9a9cf2d38df3201256dd67"
    current_track_url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=websiddu&api_key=#{api_key}&format=json&nowplaying=true&limit=1"

    url = URI.parse(current_track_url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    current_track = JSON.parse(res.body)

    # artist = current_track["recenttracks"]["track"][0]["artist"]['#text']
    # album  = current_track["recenttracks"]["track"][0]["album"]['#text']
    # mbid = current_track["recenttracks"]["track"][0]["album"]["mbid"]
    # autocorrect = 1
    # username = 'websiddu'


    # track_info_url = URI.encode("http://ws.audioscrobbler.com/2.0/?method=album.getInfo&user=websiddu&api_key=#{api_key}&format=json&artist=#{artist}&album=#{album}&autocorrect=1&limit=1")


    # track_url = URI.parse(track_info_url)
    # track_req = Net::HTTP::Get.new(track_url.to_s)
    # track_res = Net::HTTP.start(track_url.host, track_url.port) {|http|
    #   http.request(track_req)
    # }

    # current_track_info = JSON.parse(track_res.body)

    # respose = {
    #   :track => current_track["recenttracks"]["track"][0],
    #   :track_info => current_track_info
    # }



    render json: current_track["recenttracks"]["track"][0], :callback => params['callback']
  end

  private

end
