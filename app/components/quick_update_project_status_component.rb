class QuickUpdateProjectStatusComponent < ViewComponent::Base
  def initialize(project)
    @project = project
  end

  def render?
    Current.user.solicitor?
  end
end
