class DayClassesController < ApplicationController

  def new
    @school = School.find(params[:school_id])
    @teachers = @school.teachers
    @day_class = DayClass.new
  end

  def create
    @errors = []
    params[:day_class].each_value do |attrs|
      @day_class = DayClass.new(attrs)
      @day_class.school_id = params[:school_id]
      @errors += @day_class.errors.full_messages unless @day_class.save 
    end
    if @errors.empty?
      flash[:success] = "Class successfully created!"
      redirect_to schools_path
    else
      @errors.uniq!
      flash[:errors] = "Some class fields had errors. Please check the School tab
                    to see if any classes were not added."
      redirect_to schools_path
    end  
  end

  def edit
    @day_class = DayClass.find(params[:id])
  end

  def update
    @day_class = DayClass.find(params[:id])
    if @day_class.update_attributes(params[:day_class])
      flash[:success] = 'Classes successfully updated'
      redirect_to schools_path
    else
      render 'edit'
    end
  end

  def destroy
    @day_class = DayClass.find(params[:id])
    @day_class.destroy
    redirect_to schools_path
  end
end
