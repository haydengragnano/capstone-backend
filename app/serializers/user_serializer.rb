class UserSerializer < ActiveModel::Serializer
  attributes :id, :handle, :email, :image_url, :stream_url, :bio

  belongs_to :game
  has_many :tags
end
