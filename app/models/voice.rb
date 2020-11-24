class Voice < ApplicationRecord
  belongs_to :user
  has_many :goodjobs, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  def goodjobed_by?(user)
    goodjobs.where(user_id: user.id).exists?
  end

  validates :body, presence: true
  validates :body, length: { maximum: 128 }

  def self.search(search, word)
    @voice = if search == 'forward_match'
               Voice.where('body LIKE?', "#{word}%")
             elsif search == 'backward_match'
               Voice.where('body LIKE?', "%#{word}")
             elsif search == 'perfect_match'
               Voice.where('body LIKE?', word.to_s)
             elsif search == 'partial_match'
               Voice.where('body LIKE?', "%#{word}%")
             else
               Voice.all
             end
  end
end
