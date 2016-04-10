class Coment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :replies, dependent: :destroy
  validates :description, presence: true, length:{minimum: 2}
end
