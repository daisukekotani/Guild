class Voice < ApplicationRecord
    belongs_to :user
    has_many :goodjobs, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    def goodjobed_by?(user)
        goodjobs.where(user_id: user.id).exists?
    end
end    
