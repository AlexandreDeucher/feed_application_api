require 'rails_helper'

RSpec.describe "Users", type: :controller do
  let(:user) { create(:user, password: 'Senha@123', password_confirmation: 'Senha@123') }

  before do
    debugger
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end
    it 'change-password' do
      debugger
      params = {
        id: @current_user.id,
        user: {password: '123456789', password_confirmation: '123456789'}
      }

      put :user_registration_path
      expect(response).to have_http_status(200)
    end
end


# include Devise::Test::ControllerHelpers