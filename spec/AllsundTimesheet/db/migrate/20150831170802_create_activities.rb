class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :client
      t.belongs_to :client, index: true, foreign_key: true
      t.decimal :budget
      t.decimal :revenue
      t.boolean :chargeable
      t.boolean :productive
      t.boolean :utilised
      t.string :notes

      t.timestamps null: false
    end
  end
end
