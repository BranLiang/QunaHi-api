require 'rails_helper'

RSpec.describe 'Password Reset Flow', type: :request do

  let(:john) { create(:user) }
  let(:api_key) { ApiKey.create }
  let(:headers) do
     { 'HTTP_AUTHORIZATION' => "QunaHi-Token api_key=#{api_key.access_key}:#{api_key.key}" }
  end
  let(:create_params) do
    { email: john.email, reset_password_redirect_url: 'http://example.com' }
  end
  let(:update_params) { { password: 'new_password' } }

  it 'resets the password' do
    expect(john.authenticate('password')).to_not be false
    expect(john.reset_password_token).to be nil

    post "/api/password_resets", params: { data: create_params }, headers: headers
    expect(response.status).to eq 204
    reset_token = john.reload.reset_password_token
    expect(ActionMailer::Base.deliveries.last.body).to match reset_token

    sbj = get "/api/password_resets/#{reset_token}"
    expect(sbj).to redirect_to("http://example.com?reset_token=#{reset_token}")

    patch "/api/password_resets/#{reset_token}", params: { data: update_params },
                                                headers: headers
    expect(response.status).to eq 204
    expect(john.reload.authenticate('new_password')).to_not be false
  end

end