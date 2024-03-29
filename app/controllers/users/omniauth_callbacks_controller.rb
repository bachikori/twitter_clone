# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    # def twitter
    # end

    # More info at:
    # https://github.com/heartcombo/devise#omniauth

    # GET|POST /resource/auth/twitter
    # def passthru
    #   super
    # end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    def github
      @user = User.find_for_github_oauth(request.env['omniauth.auth'])

      if @user.persisted? # データベースに保存されていればログイン成功
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
      else
        session['devise.github_data'] = request.env['omniauth.auth']
        if @user.invalid?
          flash[:error] = @user.errors.full_messages
          redirect_to new_user_session_path and return
        end
        redirect_to new_user_registration_path and return
      end
    end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end
  end
end
