class AddDefaulSettingToColumnsCards < ActiveRecord::Migration
  def change
    add_column :cards, :attempt, :integer, default: 1
    add_column :cards, :level, :integer, default: 0
  end
end
