class DayClassesController < ApplicationController

  def new
    @school = School.find(params[:school_id])
    @teachers = @school.teachers
    @day_class = DayClass.new
  end

  def create
    
    redirect_to schools_path
  end

  def index
    @schools = DayClass.all
  end

  def show
    @day_class = DayClass.find(params[:id])
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
