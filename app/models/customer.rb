class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cartitems
  has_many :products, through: :cartitems
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy


  has_many :cartitems, dependent: :destroy
  has_many :cards, dependent: :destroy, foreign_key: 'user_id'
  belongs_to :prefecture, optional:true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :email, presence: true

  acts_as_paranoid

  def name
  	last_name + first_name
  end

  def name_kana
    lastname_kana + firstname_kana
  end

  def homeaddress
    Prefecture.find(prefecture_id).name + municipality + address

  end


    # prefecture_id.to_s + municipality + address





end
