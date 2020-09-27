class TweetsController < ApplicationController
  before_action :forbid_logout_user

  def show
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to timeline_path, notice: 'You tweeted'
    else
      flash.now[:error] = 'Failed to tweet..'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(
      :content,
      {images: []}
    )
  end
end
