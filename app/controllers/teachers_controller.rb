class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
    @school_id = params[:school]
  end

  def create
    @errors = []
    params[:teacher].each_value do |attrs|
      @teacher = Teacher.new(attrs)
      @teacher.school_id = params[:school_id]
      @errors += @teacher.errors.full_messages unless @teacher.save 
    end
    if @errors.empty?
      flash[:success] = "Teachers successfully created!"
      redirect_to new_school_day_class_path
    else
      @errors.uniq!
      flash[:errors] = "Some teacher fields had errors. Please check the School tab
                    to see if any teachers were not added."
      redirect_to new_school_day_class_path
    end  
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher]['0'])
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
end
