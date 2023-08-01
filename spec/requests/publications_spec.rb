require 'rails_helper'

RSpec.describe PublicationsController, type: :controller do
  
  let(:user) { create(:user, password: 'Senha1234', password_confirmation: 'Senha1234') }
  let(:publication) { create(:publication, title: 'alexandre', description: 'mutioads', user_id: user.id) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end
  
  it 'index' do
    get :index
    expect(response).to have_http_status(200)
  end

  it 'show' do
    get :show, params: {id: publication.id}
    expect(response).to have_http_status(200)
  end

  it 'put' do
    put :update, params: {id: publication.id, publication: {title: "batata", description: "batata assada"}}
    expect(response).to have_http_status(200)
  end

  it 'destroy' do
    delete :destroy, params: {id: publication.id}
    expect(response).to have_http_status(204)
  end
end
