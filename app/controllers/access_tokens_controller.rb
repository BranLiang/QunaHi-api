class AccessTokensController < ApplicationController
  before_action :authenticate_user, only: :destroy

  def create
    skip_authorization
    user = User.find_by!(email: login_params[:email])

    if user.authenticate(login_params[:password])
      AccessToken.find_by(user: user, api_key: api_key).try(:destroy)

      access_token = AccessToken.create(user: user, api_key: api_key)
      token = access_token.generate_token

      render json: user, status: :created, meta: { token: token }
    else
      render status: :unprocessable_entity,
             json: { error: { message: I18n.t('invalid_credentials') } }
    end
  end

  def destroy
    authorize(access_token)
    access_token.destroy
    render status: :no_content
  end

  private

  def login_params
    params.require(:data).permit(:email, :password)
  end
end
