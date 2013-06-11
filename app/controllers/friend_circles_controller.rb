class FriendCirclesController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @fc = FriendCircle.new(params[:friend_circle])
    if @fc.save
      redirect_to friend_circles_url
    else
      render :new
    end
  end

  def edit
    @users = User.all
    @friend_circle = FriendCircle.find(params[:id])
  end

  def update
    @friend_circle = FriendCircle.find(params[:id])
    if @friend_circle.update_attributes(params[:friend_circle])
      redirect_to @friend_circle
    else
      render :edit
    end
  end

  def destroy

  end

end
