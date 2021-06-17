class CreateRoulettes < ActiveRecord::Migration[6.1]
  def change
    create_table :roulettes do |t|
      t.integer :rand_number
      t.string :color

      t.timestamps
    end
  end
end
