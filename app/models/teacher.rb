class Teacher < ActiveRecord::Base
  # attr_accessible :first_name, :last_name, :school_id

  has_many :day_classes
  belongs_to :school
end
