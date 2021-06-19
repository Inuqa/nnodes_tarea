class ChangeRandNumberToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :roulettes, :rand_number, :float
  end
end
