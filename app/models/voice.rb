class Voice < ApplicationRecord
    belongs_to :user
    has_many :goodjobs, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    def goodjobed_by?(user)
        goodjobs.where(user_id: user.id).exists?
    end
    
  def self.search(search, word)
    if search == "forward_match"
      @voice = Voice.where("body LIKE?","#{word}%")
    elsif search == "backward_match"
      @voice = Voice.where("body LIKE?","%#{word}")
    elsif search == "perfect_match"
      @voice = Voice.where("body LIKE?","#{word}")
    elsif search == "partial_match"
      @voice = Voice.where("body LIKE?","%#{word}%")
    else
      @voice = Voice.all
    end
  end    
end    
