require 'rails_helper'

RSpec.describe Publication, type: :model do
#-----------------------------------TESTE-----------------------------------#     
    it "testing the creation of a publication" do
        publication = create(:publication)
        expect(publication).to be_persisted
    end
#-----------------------------------TESTE-----------------------------------#     
    it "checking if publication fields exist and checks for null fields" do
        publication = create(:publication, title: "vamo", description: "receba")
        expect(publication).to have_attributes(:title => be_kind_of(String).and(be_truthy), :description => be_kind_of(String).and(be_truthy), user: be_truthy)
    end
# #-----------------------------------TESTE-----------------------------------# 
    it "is not valid without a title" do
        publication = Publication.new(title: nil)
        expect(publication).to_not be_valid
    end
  
    it "is not valid without a description" do
        publication = Publication.new(description: nil)
        expect(publication).to_not be_valid
    end
#-----------------------------------TESTE-----------------------------------# 
end