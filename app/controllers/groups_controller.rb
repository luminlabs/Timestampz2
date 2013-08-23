class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.flash
      save[:success] = "Group successfully created!"
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @groups = Group.by_teacher
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group successfully updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  private 
  
  def group_params
    params.require(:group).permit(:name, :teacher_first_name ,:teacher_last_name, :grade_level)
  end
  # attr_accessible :name, :teacher_first_name ,:teacher_last_name, :grade_level
end
