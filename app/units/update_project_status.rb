class UpdateProjectStatus
  prepend Command

  InvalidPermissionError = Class.new(StandardError)

  attr_reader :project, :new_status, :user, :status_change

  def initialize(project:, new_status:, user:)
    @project = project
    @new_status = new_status
    @user = user
  end

  def call
    if !allowed_to_update_status?
      raise InvalidPermissionError, "User #{user.email} is not allowed to change this project's status"
    end

    transaction do
      project.update!(status: new_status)

      @status_change = ProjectStatusChange.create!(
        previous_status: project.status_previously_was,
        current_status: new_status,
        user: user,
        project: project
      )
    end
  end

  protected

  def allowed_to_update_status?
    project.users.include?(user) && user.role == 'solicitor'
  end
end
