
  class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  private
 
  def callback_for(provider) 
    auth = request.env["omniauth.auth"] 
    @user = User.find_or_create_by(provider: auth.provider, provider_uid: auth.uid) do |user| 
      user.nick_name = auth.info.name
      user.email = "#{auth.provider}-#{auth.uid}@example.com"
      user.provider = auth.provider
      user.provider_token = auth.credentials.token
      user.provider_uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.encrypted_password = [*1..9, *'A'..'Z', *'a'..'z'].sample(10).join
    end 
    if @user.persisted?
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end