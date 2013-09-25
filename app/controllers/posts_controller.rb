class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
    set_unscoped_post
    if @post.update(post_params)
      redirect_to @post
    else
      render action: 'index'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_unscoped_post
    @post = Post.unscoped.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :deleted)
  end
end
