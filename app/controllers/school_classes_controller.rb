class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:edit, :show, :update, :destroy]
  def index
    @school_classes = SchoolClass.all
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.create(school_classes_params(:title, :room_number))
    if @school_class.valid?  
      redirect_to school_class_path(@school_class)
    else 
      flash[:messages] = new_item.errors.full_messages
      redirect_to new_school_class_path
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def school_classes_params(*args)
    params.require(:school_class).permit(*args)
  end

  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end

end
