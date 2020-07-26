class Problem < ApplicationRecord
  belongs_to :user

  validates :memo, presence: true
  validates :priority, presence: true
  validates :user_id, uniqueness: { scope: :memo }
end
