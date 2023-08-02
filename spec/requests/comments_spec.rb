require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user, password: 'Senha1234', password_confirmation: 'Senha1234') }
  let(:publication) { create(:publication, title: 'alexandre', description: 'mutioads', user: user) }
  let(:comment) { create(:comment, commentable: publication, comment: 'alexandre', user: user) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end

  it 'create' do
    post :create, params: {comment: {comment: comment.comment, publication_id: publication.id}}
    expect(response).to have_http_status(200)
  end

  it 'index' do
    get :index, params: {comment: {publication_id: publication.id}}
    expect(response).to have_http_status(200)
  end

  it 'update' do
    put :update, params: {comment: {comment: comment.comment}, id: comment.id}
    expect(response).to have_http_status(200)
  end

  it 'destroy' do
    delete :destroy, params: {comment: {comment: comment.comment}, id: comment.id}
    expect(response).to have_http_status(204)
  end

end
