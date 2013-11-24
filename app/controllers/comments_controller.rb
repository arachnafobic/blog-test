class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # In Rails 4.x it should be like this:
    # @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
