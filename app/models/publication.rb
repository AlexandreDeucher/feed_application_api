class Publication < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    
    validates :title, presence: true
    validates :description, presence: true
end
