class ExpressionEvaluator
  def initialize(tokens)
    @tokens = tokens
    @numbers = []
  end

  def execute
    @tokens.each do |token|
      push_number(token) if token.type == :number
      evaluate_operation(token) if token.type == :operator
    end

    @numbers.last.value
  end

  def push_number(token)
    @numbers << token
  end

  def evaluate_operation(token)
    right_side = @numbers.pop
    left_side = @numbers.pop

    raise 'Invalid expression' unless right_side && left_side

    result = evaluate(left_side.value, right_side.value, token)
    @numbers << Token.new(:number, result)
  end

  def evaluate(left_side, right_side, operation)
    case operation.value
    when '+' then left_side + right_side
    when '-' then left_side - right_side
    when '*' then left_side * right_side
    when '/' then left_side / right_side
    end
  end
end
