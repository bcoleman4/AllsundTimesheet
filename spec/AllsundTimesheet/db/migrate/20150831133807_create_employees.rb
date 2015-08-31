class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.belongs_to :rate, index: true, foreign_key: true
      t.belongs_to :cost, index: true, foreign_key: true
      t.string :notes

      t.timestamps null: false
    end
  end
end
