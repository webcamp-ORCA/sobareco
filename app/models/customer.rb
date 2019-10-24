class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cartitems
  has_many :products, through: :cartitems
  has_many :orders, dependent: :destroy
  validates :name, presence: true
  validates :post_code, presence: true
  validates :prefectures, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
  validates :email, presence: true

  acts_as_paranoid
  
  def name
  	last_name + first_name
  end

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
