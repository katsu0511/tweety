class FollowersController < ApplicationController
  before_action :forbid_logout_user

  def index
  end
end
