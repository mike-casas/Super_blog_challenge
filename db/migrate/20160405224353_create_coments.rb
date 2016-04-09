class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.text :description
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
