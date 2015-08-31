class Timesheet < ActiveRecord::Base
  belongs_to :employee
  belongs_to :activity
  belongs_to :day
  belongs_to :workstream
end
