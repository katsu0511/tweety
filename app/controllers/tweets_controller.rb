class TweetsController < ApplicationController
  before_action :forbid_logout_user

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to timeline_path, notice: 'ツイートしました'
    else
      flash.now[:error] = 'ツイートに失敗しました..'
      render :new
    end
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした..'
      render :edit
    end
  end

  def destroy
    tweet = current_user.tweets.find(params[:id])
    tweet.destroy!
    redirect_to timeline_path, notice: '削除しました'
  end

  private
  def tweet_params
    params.require(:tweet).permit(
      :content,
      {images: []}
    )
  end
end
