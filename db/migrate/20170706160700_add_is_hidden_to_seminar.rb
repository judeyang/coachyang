class AddIsHiddenToSeminar < ActiveRecord::Migration[5.0]
  def change
    add_column :seminars, :is_hidden, :boolean, default: true
  end
end
