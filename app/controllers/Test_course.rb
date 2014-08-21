class CourseController < ApplicationController



  def index
    @Courses = Course.sorted
  end

  def show
    @Courses = Course.find(params[:id])
  end

  def new
    @Courses = Course.new({:name => "Default"})
  end

  def create
    @Course = Course.new(course_params)
    if @Course.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @Course = Course.find(params[:id])
  end

  def update
    @Course = Course.find(params[:id])
    if @Course.update_attributes(course_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @Course.id)
    else
      render('edit')
    end
  end

  def delete
    @Course = Course.find(params[:id])
  end

  def destroy
    @Course = Course.find(params[:id]).destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def course_params
      params.require(:Course).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end

end
