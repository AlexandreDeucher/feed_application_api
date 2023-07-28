require 'rails_helper'

RSpec.describe User, type: :model do
#-----------------------------------TESTE-----------------------------------#     
    it "testing the creation of a user" do
        user = create(:user)
        expect(user).to be_persisted
    end
#-----------------------------------TESTE-----------------------------------#     
    it "checking if user fields exist and checks for null fields" do
        user = create(:user, name: "alexandre", email: "alexandre@gmail.com")
        expect(user).to have_attributes(:name => be_kind_of(String).and(be_truthy), :email => be_kind_of(String).and(be_truthy), :password => be_kind_of(String).and(be_truthy), :password_confirmation => be_kind_of(String).and(be_truthy))
    end
#-----------------------------------TESTE-----------------------------------# 
    it "is not valid without a name" do
        user = User.new(name: nil)
        expect(user).to_not be_valid
    end
  
    it "is not valid without a email" do
        user = User.new(email: nil)
        expect(user).to_not be_valid
    end

    it "is not valid without a password" do
        user = User.new(password: nil)
        expect(user).to_not be_valid
    end

    it "is not valid without a password_confirmation" do
        user = User.new(password_confirmation: nil)
        expect(user).to_not be_valid
    end
#-----------------------------------TESTE-----------------------------------# 

end