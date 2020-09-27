class ProfilesController < ApplicationController
  before_action :forbid_logout_user

  def show
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
  end
end
