class MainPagesController < ApplicationController

  def trash
    @posts = Post.where(deleted: true)
  end
end
