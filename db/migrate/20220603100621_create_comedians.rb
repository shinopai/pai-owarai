class CreateComedians < ActiveRecord::Migration[7.0]
  def change
    create_table :comedians do |t|
      t.string :stage_name, null: false
      t.text :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
