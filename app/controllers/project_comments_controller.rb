class ProjectCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_users_project, only: %i[create]

  def create
    @comment = ProjectComment.new(comment_params)
    @comment.user = current_user
    @comment.project = @project
    @comment.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  protected

  def comment_params
    params.require(:project_comment).permit(:content)
  end

  def load_users_project
    @project = current_user.projects.find(params[:project_id])
  end
end
