class AddReferencesToRouletteAndPlayer < ActiveRecord::Migration[6.1]
  def change
    create_table :players_roulettes, id: false do |t|
      t.belongs_to :player
      t.belongs_to :roulette
    end
  end
end
