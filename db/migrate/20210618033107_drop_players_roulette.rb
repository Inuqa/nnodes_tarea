class DropPlayersRoulette < ActiveRecord::Migration[6.1]
  def up
    drop_table :players_roulettes
  end

  def down
    create_table :players_roulettes, id: false do |t|
      t.belongs_to :player
      t.belongs_to :roulette
    end
  end
end
