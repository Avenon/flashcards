class AddDeckToCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.belongs_to :deck, index: true
    end
  end
end
