class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  # composed_of :fullname,
  # 	:class_name => "FullName",
  # 	:mapping => [
  # 				[ :last_name, :family_name],
  # 				[ :first_name, :given_name]
  # 			    ]
  # 			end
  # class FullName
  # 	attr_render :family_name, :given_name

  # 	def initialize(family_name, given_name)
  # 		@family_name = family_name
  # 		@given_name = given_name
  # 	end

  # 	def to_s
  # 		[@family_name, @given_name].compact.join("")
  # 	end
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
