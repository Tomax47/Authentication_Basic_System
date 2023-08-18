
require 'date'

#MAKE SURE TO CHANGE THE VALUE OF @blogpost = Blogpost.<somthing> TO @blogpost = current_user.blogpost.<Something>
# in the def {index, new, create, set_blogpost}


class BlogpostsController < ApplicationController

  before_action :set_blogpost, only: %i[ show edit update destroy ]
  before_action :ensure_current_user
  before_action :has_posts
  # GET /blogposts or /blogposts.json
  def index
    @blogposts = current_user.blogposts
  end

  # GET /blogposts/1 or /blogposts/1.json
  def show
  end

  # GET /blogposts/new
  def new
    #@blogpost = Blogpost.new

    #Building through the associations <has_many :blogposts & belongs_to :user> we have created!
    # Instead of having the new blogpost created like above, we now can associate it to the user who created it!
    @blogpost = current_user.blogposts.new
  end

  # GET /blogposts/1/edit
  def edit
  end

  # POST /blogposts or /blogposts.json
  def create

    #Same here we will create the blogpost through the associations we have created!
    @blogpost = current_user.blogposts.new(blogpost_params)

    #we pass the user id here and not in the user_params, cuz we aint want to create a hidden field in the frontend
    # cuz that way our webapp will be vulnerable, and exposed to the users to be messed with!!
    @blogpost.user_id = current_user.id
    @blogpost.aouther = current_user.email
    @blogpost.publish_date = DateTime.now

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to blogpost_url(@blogpost), notice: "Blogpost was successfully created." }
        format.json { render :show, status: :created, location: @blogpost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogposts/1 or /blogposts/1.json
  def update
    respond_to do |format|
      if @blogpost.update(blogpost_params)
        format.html { redirect_to blogpost_url(@blogpost), notice: "Blogpost was successfully updated." }
        format.json { render :show, status: :ok, location: @blogpost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogposts/1 or /blogposts/1.json
  def destroy
    @blogpost.destroy

    respond_to do |format|
      format.html { redirect_to blogposts_url, notice: "Blogpost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogpost
      #Again, instead of setting the blogposts to be shown for the blogpost itself, we will set the blogposts for the current user only, meaning even if the user tried to mess with the url and added an blogpost's id of a post that ain't theirs, the pots won't be shown!
      #@blogpost = Blogpost.find(params[:id])
      @blogpost = current_user.blogposts.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def blogpost_params
      params.require(:blogpost).permit(:title, :aouther, :content, :publish_date)
    end
end
