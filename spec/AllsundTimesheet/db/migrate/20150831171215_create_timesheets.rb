class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :date
      t.belongs_to :employee, index: true, foreign_key: true
      t.belongs_to :activity, index: true, foreign_key: true
      t.belongs_to :day, index: true, foreign_key: true
      t.belongs_to :workstream, index: true, foreign_key: true
      t.string :notes

      t.timestamps null: false
    end
  end
end
