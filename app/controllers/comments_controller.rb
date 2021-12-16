class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
    redirect_to posts_path(@post)
    else
    render 'posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
   Comment.find_by(id: params[:id]).destroy
    redirect_to posts_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
