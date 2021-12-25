class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:mypage, :index, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @post = Post.new
  end


  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @posts = @user.posts
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
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



  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(PER)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(PER)
  end


  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :sauna_years, :number_of_sets, :image, :admin)
  end
end