class Coment < ActiveRecord::Base
  belongs_to :post
  has_many :replies
end
