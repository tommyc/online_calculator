class ExpressionParser
  attr_reader :output
  def initialize(tokens)
    @tokens = tokens
    @output = []
    @operators = []
  end

  def parse
    @tokens.each do |token|
      @output << token if token.type == :number
      evaluate_operator(token) if token.type == :operator
    end
    @output += @operators.reverse

    self
  end

  def evaluate_operator(token)
    while op_priority(token)
      @output << @operators.pop
    end
    @operators << token
  end

  def op_priority(token)
    @operators.last && (token.priority <= @operators.last.priority)
  end

  def to_s
    @output.map(&:value).join(' ')
  end
end
