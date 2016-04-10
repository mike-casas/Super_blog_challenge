class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true , length: {minimum: 8}
  has_many :coments , dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
end
