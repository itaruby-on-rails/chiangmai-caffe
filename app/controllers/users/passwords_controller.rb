class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_user, only: :create

  def ensure_normal_user
    if params[:user][:email].downcase == "guest@example.com"
      redirect_to new_user_session_path, alert: "guest user can't reset password"
    end
  end
end
