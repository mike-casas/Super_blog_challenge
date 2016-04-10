class Coment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :replies, dependent: :destroy
end
