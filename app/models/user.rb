class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image, destroy: false       
         
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
  分類不能の産業: 19,
}

end
