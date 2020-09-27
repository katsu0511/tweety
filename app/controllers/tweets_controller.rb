class TweetsController < ApplicationController
  before_action :forbid_logout_user

  def show
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
