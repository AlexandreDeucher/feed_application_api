require 'rails_helper'

RSpec.describe PublicationsController, type: :controller do
  
  let(:user) { create(:user, password: 'Senha1234', password_confirmation: 'Senha1234') }
  let(:publication) { create(:publication, title: 'alexandre', description: 'mutioads', user_id: user.id) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end
    describe "#Create" do
      context "when given valid parameters" do
        it 'create' do
          post :create, params: {title: publication.title, description: publication.description, publication: {title: publication.title, description: publication.description}}
          expect(response).to have_http_status(201)
        end
      end
    end
    describe "#Index" do 
      context "when given valid parameters" do
        it 'list' do
          get :index
          expect(response).to have_http_status(200)
        end
      end
    end
    describe "#Show" do
      context "when given valid parameters" do
        it 'show unique publication' do
          get :show, params: {id: publication.id}
          expect(response).to have_http_status(200)
        end
      end
    end
    describe "#Update" do
      context "when given valid parameters" do
        it 'updated data' do
          put :update, params: {id: publication.id, publication: {title: "batata", description: "batata assada"}}
          expect(response).to have_http_status(200)
        end
      end
    end
    describe "#Destroy" do
      context "when given valid parameters" do
      it 'destroy publication' do
        delete :destroy, params: {id: publication.id}
        expect(response).to have_http_status(204)
      end
    end
  end
end
