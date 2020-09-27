class ProfilesController < ApplicationController
  before_action :forbid_logout_user

  def show
    @user = current_user
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :name,
      :introduction,
      :birthday,
      :icon
    )
  end
end
