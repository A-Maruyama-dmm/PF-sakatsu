class PostsController < ApplicationController
  def new
    @post = Post.new
    @user = User.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "You have created b successfully."
      return redirect_to post_path(@post.id)
    end
    @posts = Post.all
    render 'index'
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
    @user = @post.user
    @new_post = Post.new
    @comment = Comment.new
  end

  def authorization
    if current_user.admin
      @post = Post.find(params[:post_id])
      @post.admin = true
      @post.save
    end
    redirect_to post_path(params[:post_id])
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



  private

  def post_params
    params.require(:post).permit(:sauna_name, :address, :url, :sauna_image_id, :sauna_temperature, :water_bath_temperature, :outside_air_bath, :congestion, :time_zorn, :vending_machine, :comprehensive_evaluation, :evaluation)
  end


end


