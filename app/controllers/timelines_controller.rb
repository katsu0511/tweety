class TimelinesController < ApplicationController
  before_action :forbid_logout_user

  def show
    @users = current_user.followings
  end
end
