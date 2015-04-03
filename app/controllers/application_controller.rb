class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @projects = Project.all
  end

  def show
    @projects = Project.find(params[:id])
  end

  def new
    @projects = Project.new
  end

  def create
    @projects = Project.new(project_params)
    if @projects.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
    @projects = Project.find(params[:id])
  end

  def update
    @projects = Project.find(params[:id])
    if @projects.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @projects = Project.find(params[:id])
    @projects.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params[:project].permit(:title)
  end

end
