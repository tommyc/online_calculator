class Token
  attr_reader :type
  def initialize(type, value)
    @type = type
    @value = value
  end

  def ==(other)
    value == other.value && type == other.type
  end

  def value
    @type == :number ? @value.to_f : @value
  end

  def priority
    return 1 if value == '+' || value == '-'
    return 2 if value == '*' || value == '/'
  end
end
