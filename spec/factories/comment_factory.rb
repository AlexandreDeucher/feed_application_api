FactoryBot.define do
    factory :comment do
        comment {Faker::Books::Lovecraft.paragraphs}
        association :user        
        association :commentable, factory: [:publication]
        #association :commentable, factory: [:publication, :comment]
    end
end