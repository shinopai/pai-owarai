class CreateLives < ActiveRecord::Migration[7.0]
  def change
    create_table :lives do |t|
      t.string :title, null: false
      t.date :performance_date, null: false
      t.time :starting_time, null: false
      t.time :closing_time, null: false
      t.string :venue, null: false
      t.integer :price, null: false
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
