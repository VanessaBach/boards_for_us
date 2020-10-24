class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :type
      t.string :size
      t.references :user, null: false, foreign_key: true
      t.integer :year
      t.float :price_per_day

      t.timestamps
    end
  end
end
