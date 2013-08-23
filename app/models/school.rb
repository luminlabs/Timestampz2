class School < ActiveRecord::Base
  attr_accessible :name

  has_many :day_classes, dependent: :destroy
  has_many :students
  has_many :teachers, dependent: :destroy

  validates_presence_of :name
end
