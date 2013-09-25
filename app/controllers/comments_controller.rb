class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post
    else
      render action: 'new'
    end
  end

  def new
    @comment = @post.comments.new
  end

  def show
  end

  def destroy
    @comment.destroy
    redirect_to comments_url
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
