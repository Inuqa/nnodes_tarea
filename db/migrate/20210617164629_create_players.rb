class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :money, default: 10_000

      t.timestamps
    end
  end
end
