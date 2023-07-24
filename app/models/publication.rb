class Publication < ApplicationRecord
    belongs_to :user
    has_many :comment
    
    def as_json(options={})
        super(
            root: true,
            include: {user:{only: [:id, :name]}}
        )         
    end
end
