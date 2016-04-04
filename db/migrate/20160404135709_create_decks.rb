class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.text :description
      t.boolean :active
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
