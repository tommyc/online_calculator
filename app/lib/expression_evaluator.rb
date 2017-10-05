class ExpressionEvaluator

  def initialize(tokens)
    @tokens = tokens
    @numbers = []
  end

  def execute
    @tokens.each do |token|
      # puts "TOKEN IN EXECUTE #{token.inspect}"
      push_number(token) if token.type == :number
      evaluate_operation(token) if token.type == :operator
      # puts "@NUMBERS #{@numbers}"
    end

    @numbers.last.value
  end

  def push_number(token)
    @numbers << token
  end
  def evaluate_operation(token)
    puts "TOKEN #{token.inspect}"
    puts "@NUMBERS #{@numbers}"
    right_side = @numbers.pop
    left_side = @numbers.pop

    raise "Invalid expression" unless right_side && left_side

    puts "LEFT_SIDE VALUE #{left_side.value}"
    puts "RIGHT_SIDE VALUE #{right_side.value}"
    result = evaluate(left_side.value, right_side.value, token)
    puts "RESULT #{result}"
    @numbers << Token.new(:number, result)
  end

  def evaluate(left_side, right_side, operation)
    puts "LEFT_SIDE IN EVALUATE #{left_side}"
    puts "RIGHT_SIDE IN EVALUATE #{right_side}"
    case operation.value
    when '+' then left_side + right_side
    when '-' then left_side - right_side
    when '*' then left_side * right_side
    when '/' then left_side / right_side
    end
  end
end
