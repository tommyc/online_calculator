require 'strscan'
require 'expression_tokenizer'
require 'expression_parser'
require 'expression_evaluator'

class Calculator
  attr_reader :expression
  def initialize(expr)
    @expression = expr
  end

  def calculate
    return @expression.to_i if @expression.scan(/\d+/).size == 1
    tokens = ExpressionTokenizer.new(@expression).parse
    postfix = ExpressionParser.new(tokens).parse
    # puts "postfix.output ========== #{postfix.output}"
    ExpressionEvaluator.new(postfix.output).execute
  end
end
