class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    @user = AdminUser.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "Signed in with Google!"
      sign_in_and_redirect @user
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      flash.notice = "Error: " + @user.errors.full_message
      redirect_to new_user_registration_url
    end
  end

  alias_method :google_oauth2, :all
end
