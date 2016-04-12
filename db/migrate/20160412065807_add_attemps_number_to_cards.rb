class AddAttempsNumberToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :attempt
      t.integer :level
    end
  end
end
