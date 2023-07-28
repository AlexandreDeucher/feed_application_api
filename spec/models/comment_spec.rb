require 'rails_helper'

RSpec.describe Comment, type: :model do
#-----------------------------------TESTE-----------------------------------#     
    # it "testing the creation of a comment" do
    #     comment = create(:comment)
    #     expect(comment).to be_persisted
    # end
#-----------------------------------TESTE-----------------------------------#     
#     it "checking if comment fields exist and checks for null fields" do
#         comment = create(:comment, comment: "vamo")
#         expect(comment).to have_attributes(:comment => be_kind_of(String).and(be_truthy), user: be_truthy, commentable: be_truthy )
#     end
# # #-----------------------------------TESTE-----------------------------------# 
    it "is not valid without a title" do
        comment = Comment.new(comment: nil)
        expect(comment).to_not be_valid
    end
#-----------------------------------TESTE-----------------------------------# 
end