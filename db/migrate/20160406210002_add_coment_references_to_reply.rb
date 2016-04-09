class AddComentReferencesToReply < ActiveRecord::Migration
  def change
    add_reference :replies, :coment, index: true, foreign_key: true
  end
end
