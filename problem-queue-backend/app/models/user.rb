class User < ApplicationRecord
  has_many :problems

  validates :name, presence: true
end
