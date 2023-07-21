class Publication < ApplicationRecord
    belongs_to :user


    def as_json(options={})
        super(
            root: true,
            include: {user:{only: [:id, :name]}}
        )         
    end
end
