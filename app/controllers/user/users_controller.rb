class User::UsersController < ApplicationController

  def my_page

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])

    unless current_user.id == @user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:success] = "You have updated user successfully."
    else
      @posts = Post.all
      render :edit
    end
  end

  def index
    @users = User.all
    @post = Post.new
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(PER)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(PER)
  end


  private

  def user_params
    params.require(:user).permit(:name, :age, :sauna_yesrs, :number_of_sets, :image_id, :admin)
  end
end