# == Schema Information
#
# Table name: groups
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  grade_level        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  teacher_first_name :string(255)      not null
#  teacher_last_name  :string(255)      not null
#

class Group < ActiveRecord::Base
  # attr_accessible :name, :teacher_first_name ,:teacher_last_name, :grade_level

  has_many :student_groups
  has_many :students, through: :student_groups

  validates_presence_of(:name)
  validates_presence_of(:teacher_first_name)
  validates_presence_of(:teacher_last_name)

  scope :by_teacher, order("teacher_first_name")
end
