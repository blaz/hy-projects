class CommandErrors < Hash
  def self.from_active_model(active_model_errors)
    new.tap do |errors|
      active_model_errors.each do |attribute, messages|
        path = attribute.to_s.split('.')
        Array(messages).each { |message| errors.add(path, message) }
      end
    end
  end

  def add(path, value, _opts = {})
    self[path] ||= []
    self[path] << value
    self[path].uniq!
  end

  def each
    each_key do |path|
      self[path].each { |message| yield path, message }
    end
  end

  def to_sentence
    values.flatten.to_sentence
  end
end
