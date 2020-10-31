class FavoritesController < ApplicationController
  before_action :forbid_logout_user

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @user = current_user
    end
  end
end
