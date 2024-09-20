class ProjectTimeline
  include Enumerable

  attr_reader :project

  def initialize(project)
    @project = project
  end

  def timeline
    items
  end

  def each
    items.each { |item| yield item }
  end

  def to_a
    items
  end

  protected

  def items
    (@project.comments + @project.status_changes).sort_by(&:created_at).reverse
  end
end
