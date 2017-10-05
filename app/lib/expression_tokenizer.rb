require 'strscan'
require_relative './token'

class ExpressionTokenizer
  def initialize(expr)
    @expression = expr
    @tokens = []
  end

  TOKEN_REGEX = { /\d+/ => :number, /[\+\-\*\/]/ => :operator}
  def parse
    exp_buff = StringScanner.new(@expression)

    until exp_buff.eos?
      exp_buff.skip(/\s+/)
      TOKEN_REGEX.each do |regex, type|
        token = exp_buff.scan(regex)
        @tokens << Token.new(type, token) if token
      end
    end
    @tokens
  end
end
