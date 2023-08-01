require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user, password: 'Senha1234', password_confirmation: 'Senha1234') }
  let(:publication) { create(:publication, title: 'alexandre', description: 'mutioads', user_id: user.id) }
  let(:comment) { create(:comment, description: 'mutioads', user_id: user.id, publication_id: publication.id) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end

  
end
