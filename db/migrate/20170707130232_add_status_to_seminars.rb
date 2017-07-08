class AddStatusToSeminars < ActiveRecord::Migration[5.0]
  def change
    add_column :seminars, :status, :string, :default => "draft"
  end
end
