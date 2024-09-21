class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_users_project, only: %i[show update_status]

  def index
    @projects = current_user.projects
  end

  def show
    @timeline = ProjectTimeline.new(@project)
  end

  def update_status
    if @project.update(status: project_params[:status])
      @status_change = ProjectStatusChange.create!(
        previous_status: @project.status_previously_was,
        current_status: project_params[:status],
        user: current_user,
        project: @project
      )
    end
    
    respond_to do |format|
      format.turbo_stream
    end
  end

  protected

  def load_users_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:status)
  end
end
