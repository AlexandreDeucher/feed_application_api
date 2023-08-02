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

  describe "#Create" do
    context "when given valid parameters of publications " do 
      it 'create' do
        post :create, params: {comment: {comment: comment.comment, publication_id: publication.id}}
        expect(response).to have_http_status(200)
      end
    end
    context "when given invalid parameters of comments " do 
      it 'create' do
        post :create, params: {comment: {comment: nil, comment_id: comment.id}}
        expect(response).to have_http_status(422)
      end
    end
  end
  describe "#Index" do
    context "when given valid parameters of publications " do
      it 'list' do
        get :index, params: {comment: {publication_id: publication.id}}
        expect(response).to have_http_status(200)
      end
    end
    context "when given valid parameters of comments " do
      it 'list' do
        get :index, params: {comment: {comment_id: comment.id}}
        expect(response).to have_http_status(200)
      end
    end
  end
  describe "#Update" do
    context "when given valid parameters" do
      it 'updated data' do
        put :update, params: {comment: {comment: comment.comment}, id: comment.id}
        expect(response).to have_http_status(200)
      end
    end
    context "when given invalid parameters" do
      it 'updated data' do
        put :update, params: {comment: {comment: nil}, id: comment.id}
        expect(response).to have_http_status(422)
      end
    end
  end
  describe "#Destroy" do
    context "when given valid parameters" do
      it 'destroy comment' do
        delete :destroy, params: {comment: {comment: comment.comment}, id: comment.id}
        expect(response).to have_http_status(204)
      end
    end
  end
end
