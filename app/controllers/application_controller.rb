class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include SessionsHelper

  private

  def signed_in_user
    unless signed_in?
      redirect_to sign_in_url
    end
  end
end
