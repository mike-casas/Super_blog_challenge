class AddReferencesToComent < ActiveRecord::Migration
  def change
    add_reference :coments, :user, index: true, foreign_key: true
  end
end
