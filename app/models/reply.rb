class Reply < ActiveRecord::Base
  belongs_to :coment
  belongs_to :user
end
