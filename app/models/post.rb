class Post < ActiveRecord::Base
  belongs_to :user
  has_many :coments, dependent: :destroy
  validates :description, presence: true, length: {minimum: 10}
  validates :title, presence: true, length: {minimum: 4}
end
