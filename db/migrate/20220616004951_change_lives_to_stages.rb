class ChangeLivesToStages < ActiveRecord::Migration[7.0]
  def change
    rename_table :lives, :stages
  end
end
