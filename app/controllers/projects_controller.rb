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
    render :show
  end

  protected

  def load_users_project
    @project = current_user.projects.find(params[:id])
  end
end
