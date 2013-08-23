# == Schema Information
#
# Table name: student_day_classes
#
#  id           :integer          not null, primary key
#  student_id   :integer
#  day_class_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class StudentDayClass < ActiveRecord::Base
  # attr_accessible :day_class_id, :student_id

  belongs_to :students
  belongs_to :day_class
end
