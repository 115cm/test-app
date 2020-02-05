class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save

    # Project.create(project_params)
    redirect_to root_path
  end


  private

  def project_params
    params.require(:project).permit(:text).merge(user_id: current_user.id)
  end

end
