class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name
      t.decimal :hourly_rate
      t.string :notes

      t.timestamps null: false
    end
  end
end
