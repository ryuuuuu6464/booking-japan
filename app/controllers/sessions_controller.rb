class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:notice] = "メールアドレスかパスワードが違います"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
