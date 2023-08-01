require 'rails_helper'

RSpec.describe Comment, type: :model do
#-----------------------------------TESTE-----------------------------------#    
describe "" 
    it "testing the creation of a comment and validate fields" do
        comment = create(:comment)
        expect(comment).to be_persisted
        
        validate_presence_of(:title)
    end

    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:commentable)}
    it {is_expected.to have_many(:comments)}

#-----------------------------------TESTE-----------------------------------#     
end