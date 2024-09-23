module Command
  attr_reader :result

  module ClassMethods
    def call(*args, **kwargs)
      new(*args, **kwargs).call
    end
  end

  def self.prepended(base)
    base.extend ClassMethods
  end

  def call
    raise NotImplementedError unless defined?(super)

    @called = true
    @result = super

    self
  end

  def success?
    called? && !failure?
  end
  alias successful? success?

  def failure?
    called? && errors.any?
  end

  def errors
    return super if defined?(super)

    @errors ||= CommandErrors.new
  end

  protected

  def add_model_errors(model_errors)
    model_errors.each do |error|
      errors.add(error.attribute, error.message)
    end
  end

  private

  def transaction
    ActiveRecord::Base.transaction(requires_new: true) do
      yield
    end
  end

  def called?
    @called ||= false
  end
end
