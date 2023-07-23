class Restaurant < ApplicationRecord
  has_many :dishes
  has_many :reviews, as: :reviewable
  attribute :status, :string, default: 'open'
end
