class Reply < ActiveRecord::Base
  belongs_to :coment
  belongs_to :user
  validates :description, presence: true
end
