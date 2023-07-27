class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
