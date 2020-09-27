class TimelinesController < ApplicationController
  before_action :forbid_logout_user

  def show
    @user = current_user
  end
end
