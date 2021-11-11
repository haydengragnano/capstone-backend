class UserSerializer < ActiveModel::Serializer
  attributes :id, :handle, :email, :image_url, :stream_url, :bio, :game_id

  belongs_to :game
  has_many :tags
end
