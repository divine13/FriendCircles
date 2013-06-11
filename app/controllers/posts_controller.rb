class PostsController < ApplicationController
  def index
    @feed_posts = current_user.feed_posts
  end

  def new
    @friend_circles = current_user.friend_circles
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end

end
