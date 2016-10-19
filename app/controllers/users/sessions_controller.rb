class Users::SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    params[:user][:email] = normalize(params[:user][:email])
    super
  end

  private

  def normalize(email)
    email.gsub(/googlemail/, 'gmail')
  end
end
