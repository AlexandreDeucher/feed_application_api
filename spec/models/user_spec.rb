require 'rails_helper'

RSpec.describe User, type: :model do

    it "Create a User" do
        user = create(:user, name: "alexandre deucher")
        expect(user).to eq("alexandre deucher")
    end
end