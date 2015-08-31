class CreateWorkstreams < ActiveRecord::Migration
  def change
    create_table :workstreams do |t|
      t.string :name
      t.string :notes

      t.timestamps null: false
    end
  end
end
