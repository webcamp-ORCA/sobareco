class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  validates :first_name, presence: true
  # validates :post_code, presence: true
  # validates :prefectures, presence: true
  # validates :municipality, presence: true
  # validates :address, presence: true
  # validates :telephone, presence: true
  # validates :email, presence: true

  acts_as_paranoid

  def name
  	last_name + first_name
  end

end
