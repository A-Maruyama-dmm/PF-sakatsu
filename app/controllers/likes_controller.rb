class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: @post.id)
    like.save
    #redirect_to posts_path(post)非同期通信
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: params[:post_id])
    like.destroy
    #redirect_to posts_path(post)非同期通信
  end
end
