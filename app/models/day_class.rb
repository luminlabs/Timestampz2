# == Schema Information
#
# Table name: day_classes
#
#  id         :integer          not null, primary key
#  teacher    :string(255)      not null
#  period     :string(255)      not null
#  school     :string(255)      not null
#  subject    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DayClass < ActiveRecord::Base
  # attr_accessible :period, :subject, :name, :school_id, :teacher_id

  has_many :student_day_classes
  has_many :students, through: :student_day_class
  has_many :assignments
  belongs_to :school
  belongs_to :teacher

  def get_name
    "#{self.teacher.last_name}'s #{self.period} period #{self.subject}"
  end
end
