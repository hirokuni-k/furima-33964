class UsersController < ApplicationController

  def edit
  end

  def show
    user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day)
  end

end
