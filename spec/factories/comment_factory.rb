FactoryBot.define do
    factory :comment do
        comment {Faker::Books::Lovecraft.paragraphs}
        association :user
        association :commentable
    end
end