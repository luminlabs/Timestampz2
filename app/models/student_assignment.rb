# == Schema Information
#
# Table name: student_assignments
#
#  id              :integer          not null, primary key
#  student_id      :integer
#  assignment_id   :integer
#  completion_date :datetime
#  comment         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class StudentAssignment < ActiveRecord::Base
  # attr_accessible :assignment_id, :completed, :student_id

  belongs_to :student
  belongs_to :assignment
end
