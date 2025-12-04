class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      sign_in @user
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def account_edit
    @user = current_user
  end
  
  def profile_edit
    @user = current_user
  end
  
  def account_update
    @user = current_user

    if @user.update(params.require(:user).permit(:email, :password, :password_confirmation))
      flash[:notice] = "アカウントの情報を更新しました"
      redirect_to "/users/account"
    else
      render "account_edit", status: :unprocessable_entity
    end
  end

  def profile_update
    @user = current_user

    if @user.update(params.require(:user).permit(:name, :icon, :introduction))
      flash[:notice] = "プロフィールの情報を更新しました"
      redirect_to "/users/profile"
    else
      render "profile_edit", status: :unprocessable_entity
    end
  end

end
