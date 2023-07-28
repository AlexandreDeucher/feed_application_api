FactoryBot.define do
    factory :publication do
        title {Faker::Book.title}
        description {Faker::Books::Lovecraft.paragraphs}
        association :user
    end
end
#-------------------------------------#PUBLICATIONS#-------------------------------------#