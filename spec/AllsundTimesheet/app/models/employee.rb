class Employee < ActiveRecord::Base
  belongs_to :rate
  belongs_to :cost
end
