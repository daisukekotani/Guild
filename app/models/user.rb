class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image, destroy: false
  has_many :voices
  has_many :goodjobs, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # フォロー・フォロワー関連
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # フォロー取得
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  validates :name, presence: true
  validates :name, length: { maximum: 10 }
  validates :sex, presence: true
  validates :age, presence: true
  validates :income, presence: true
  validates :job, length: { maximum: 10 }
  validates :introduction, length: { maximum: 10 }

  enum industry: {
    農業・林業: 0,
    漁業: 1,
    鉱業・採石業・砂利採取業: 2,
    建設業: 3,
    製造業: 4,
    電気・ガス・熱供給・水道業: 5,
    情報通信業: 6,
    運輸業，郵便業: 7,
    卸売業・小売業: 8,
    金融業・保険業: 9,
    不動産業，物品賃貸業: 10,
    学術研究，専門・技術サービス業: 11,
    宿泊業，飲食サービス業: 12,
    生活関連サービス業，娯楽業: 13,
    教育，学習支援業: 14,
    医療，福祉: 15,
    複合サービス事業: 16,
    サービス業（他に分類されないもの）: 17,
    公務（他に分類されるものを除く）: 18,
    分類不能の産業: 19
  }

  def self.search(search, word)
    @user = if search == 'forward_match'
              User.where('name LIKE?', "#{word}%")
            elsif search == 'backward_match'
              User.where('name LIKE?', "%#{word}")
            elsif search == 'perfect_match'
              User.where('name LIKE?', word.to_s)
            elsif search == 'partial_match'
              User.where('name LIKE?', "%#{word}%")
            else
              User.all
            end
  end
end
