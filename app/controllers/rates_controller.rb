class RatesController < ApplicationController
  before_filter :authenticate, :only=> :create
    def index
    @image=image.find(params[:image_id])
    @rates = @image.rates

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rates }
    end
  end

  def create
    @image=Image.find(params[:image_id])
     
     if @rate=Rate.find_by_image_id_and_user_id(@image.id,params[:rate][:user_id])
	@rate.rate=@rate.rate+1
     else
	@rate=Rate.new(:rate=>1,:image_id=>params[:image_id],:user_id=>params[:rate][:user_id])
     end
    respond_to do |format|
      if @rate.save
        format.html { redirect_to(@image, :notice => 'Comment was successfully created.') }
        format.js 
      else
	return false
      end
     
    end
  end

end
