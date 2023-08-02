require 'rails_helper'

RSpec.describe User, type: :model do
describe "#create" do
    context 'when given valid params' do
        it "testing the creation of a user and validate fields" do
            user = create(:user)
            expect(user).to be_persisted
            validate_presence_of(:name)
            validate_presence_of(:email)
            validate_presence_of(:password)
            validate_presence_of(:password_confirmation)
        end
        it {is_expected.to have_many(:publications)}
    end
  end
end