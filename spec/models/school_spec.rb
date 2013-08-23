require 'spec_helper'

describe School do

  it { should have_many(:day_classes).dependent(:destroy) }
  it { should have_many :students }
  it { should have_many(:teachers).dependent(:destroy) }
  it { should validate_presence_of :name }
  
end
