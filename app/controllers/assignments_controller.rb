class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
    @day_classes = DayClass.all.by_name
  end

  def new
    @assignment = Assignment.new
    @day_classes = DayClass.all.by_name
    gon.day_classes = @day_classes
    @count = 0
  end

  def create
    @errors = []
    params[:assignment].each_value do |attrs|
      @assignment = Assignment.new(attrs)
      @errors += @assignment.errors.full_messages unless @assignment.save 
    end
    if @errors.empty?
      flash[:success] = "Class successfully created!"
      redirect_to assignments_path
    else
      @errors.uniq!
      flash[:errors] = "Some assignment fields had errors. Please check to
                    see if any assignments were not added."
      redirect_to assignments_path
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @day_classes = DayClass.all.map{|c| [c.subject, c.id] }
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      flash[:success] = "Assignment successfully updated."
      redirect_to assignments_path
    else
      flash[:error] = @assignment.errors
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.delete
    redirect_to assignments_path
  end

  def add_form
    @day_classes = DayClass.all
    respond_to do |format|
      format.js
    end
  end
end