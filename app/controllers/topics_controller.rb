class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
   before_filter :authenticate, :only=> [:new,:create, :destroy]
   before_filter :authorized_user, :only => :destroy
   before_filter :get_forum
  def index
  
    @topics = Topic.where(:forum_id=>@forum).paginate(:page => params[:page],:per_page => 30).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])
    @posts=@topic.posts
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    respond_to do |format|
      if @forum.topics.create!(params[:topic])
        format.html { redirect_to forum_path(@forum), notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to forum_topic_path(@forum,@topic), notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to forum_topics_url(@forum) }
      format.json { head :no_content }
    end
  end
   private
     def authorized_user
        @topic=Topic.find(params[:id])
        redirect_to forum_topics_path(@forum), notice:'You do not have the permison to do it' unless current_user?(@topic.user)
     end
     def get_forum
         @forum=Forum.find(params[:forum_id])
     end
end