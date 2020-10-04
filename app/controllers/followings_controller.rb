class FollowingsController < ApplicationController
  before_action :forbid_logout_user

  def index
    @user = User.find(params[:account_id])
  end
end
