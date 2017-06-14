class CalculatorController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def calculate
    interactor = BodyMassIndex.call(calculator_params)
    if interactor.success?
      @index = interactor.index
      @category = interactor.category
    else
      flash.now[:alert] = interactor.error
      render :new
    end
  end

  private

  def calculator_params
    params.permit(:weight, :height)
  end
end
