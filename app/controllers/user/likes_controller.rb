class User::LikesController < ApplicationController
  def create
    posts = Post.find(params[:posts_id])
    like = current_user.likes.new(posts_id: posts.id)
    like.save
    redirect_to posts_path(posts)
  end

  def destroy
  end
end
