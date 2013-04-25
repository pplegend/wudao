class RatesController < ApplicationController
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
    @rate=@image.rates.create(params[:rate]) unless @rate=Rate.find_by_image_id(@image.id)
     rate=@rate.rate+1
     
    respond_to do |format|
      if @rate.update_attributes(:rate=>rate)
        
        format.html { redirect_to(@image, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
        format.js 
      else
        format.html { render :nothing=>true, :notice => 'Comment was successfully created.' }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

end
