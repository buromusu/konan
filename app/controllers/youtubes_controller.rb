class YoutubesController < ApplicationController
  require 'rubygems'
  require 'google/api_client'
  require 'trollop'

  DEVELOPER_KEY = 'AIzaSyAMAjYZWwHOqGiJ-dhpE0ZBKIveUMO77jY'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'
  def index
    @movies = get_data("スポーツ")
  end

  def show
    @movie = Youtube.find(params[:id])
  end

  def new
    @movie = Youtube.new

  end

  def create
    @movie = current_user.youtubes.build(youtube_params)
    if @movie.save
      flash[:success] = "Post created!"
      redirect_to @movie
    else
      render root_url
    end
  end

  def search
    @movie = Youtube.find(params[:url])
    redirect_to @movie
  end

  def get_service
    client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
    )
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    return client, youtube
  end


  def get_data(keyword)
    require 'youtube.rb'#先ほど上で準備したファイルを呼ぶ
    opt = {
      q: keyword,
      type: 'video',
      max_results: 50,
      order: 'date',
      regionCode: 'JP'
    }

    client, youtube = get_service

    begin

      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => opt[:q],
          :maxResults => opt[:max_results],
          :order => opt[:order],
          :regionCode => opt[:regionCode]
        }
      )

    return search_response.data.items#Jsonの中身が多かったので必要な情報のみ受けれるようにしています。

    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end

  private

    def youtube_params
      params.require(:youtube).permit(:url, :value, :content)
    end
end
