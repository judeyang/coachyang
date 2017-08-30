class CreateSeminars < ActiveRecord::Migration[5.0]
  def change
    create_table :seminars do |t|
      t.string :title
      t.text :description
      t.date :startdate
      t.date :enddate
      t.string :gym

      t.timestamps
    end
  end
end
