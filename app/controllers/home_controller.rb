class HomeController < ApplicationController
  def index
    @uploads = Upload.all
    @recomand_musics=Music.limit(6)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
      
    end
  end
end
