require 'rails_helper'

RSpec.describe Publication, type: :model do
  describe "#create" do
    context 'when given valid params' do
      it "testing the creation of a publication and validate fields" do
        publication = create(:publication)
          expect(publication).to be_persisted
                    #verifica os campos
          validate_presence_of(:title)
          validate_presence_of(:description)
        end
          it {is_expected.to belong_to(:user)}
          it {is_expected.to have_many(:comments)}
        end
    end
end