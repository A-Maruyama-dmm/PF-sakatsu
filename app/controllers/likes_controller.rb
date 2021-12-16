class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)
    like.save
    redirect_to posts_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = Like.find(params[:id])
    like.destroy
    redirect_to posts_path(post)
  end
end
