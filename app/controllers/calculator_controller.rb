class CalculatorController < ActionController::Base
  def calc
    @result = Calculator.new(params[:expr]).calculate if params[:expr]
    flash[:notice] = @result
  end
end
