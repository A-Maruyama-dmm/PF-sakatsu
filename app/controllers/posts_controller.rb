class PostsController < ApplicationController

  def new
    @post = Post.new
    @user = User.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to post_path(@post.id)
    flash[:success] = "You have created book successfully."
    else
      @posts = Post.all
    render 'index'
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = current_user.comments.new
    @posts = Post.all
    @user = @post.user
    @new_post = Post.new
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path
  end

  def edit
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      redirect_to post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post.id)
    flash[:success] = "You have updated book successfully."
    else
    render 'edit'
    end
  end

  def change_auth
    redirect_to posts_path and return unless current_user.admin

    post = Post.find(params[:id])
    if post.authorization
      post.update(authorization: false)
    else
      post.update(authorization: true)
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:sauna_name, :address, :url, :sauna_image, :sauna_temperature, :water_bath_temperature, :outside_air_bath, :congestion, :time_zorn, :vending_machine, :evaluation, :comment, :likes)
  end


end
