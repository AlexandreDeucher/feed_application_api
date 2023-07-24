class Publication < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    
    def as_json(options={})
        super(
            root: true,
            include: {user:{only: [:id, :name]}}
        )         
    end
end
