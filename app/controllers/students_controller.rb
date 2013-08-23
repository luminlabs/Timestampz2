class StudentsController < ApplicationController
  def new
  end

  private

  def student_params
    params.require(:student).permit(:grade_level, :homeroom_teacher, :first_name, :last_name)
  end
  # attr_accessible :grade_level, :homeroom_teacher, :first_name, :last_name

end
