class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :voice

  validates :comment, presence: true
  validates :comment, length: { maximum: 128 }
end
