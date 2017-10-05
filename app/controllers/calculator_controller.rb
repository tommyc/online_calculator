class CalculatorController < ActionController::Base
  def calc
    @result = params[:expr]
    flash[:notice] = @result
  end
end
