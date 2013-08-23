class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
    @school = School.find(params[:school_id])
  end

  def create
    @errors = []
    teacher_params.each_value do |attrs|
      @teacher = Teacher.new(attrs)
      @teacher.school_id = params[:school_id]
      @errors += @teacher.errors.full_messages unless @teacher.save 
    end
    if @errors.empty?
      flash[:success] = "Teachers successfully created!"
      redirect_to new_school_day_class_path
    else
      @errors.uniq!
      flash[:errors] = "Some teachers fields had errors. Please check the School tab
                    to see if any teachers were not added."
      redirect_to new_school_day_class_path
    end  
  end


  # def index
  #   @teachers = Teacher.all
  # end

  # def show
  #   @teacher = Teacher.find(params[:id])
  # end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      flash[:success] = 'Teacher successfully updated'
      redirect_to schools_path
    else
      render 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to schools_path
  end

  private
# :first_name, :last_name, :school_id
  def teacher_params
    params.require(:teacher).permit(:first_name,:last_name,:school_id)
  end

end
