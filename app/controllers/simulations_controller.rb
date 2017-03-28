class SimulationsController < ApplicationController
  def input
    @simulation = Simulation.new
  end

  def create
    @simulation = Simulation.new(simulation_params)
    @simulation.simulate!

    redirect_to result_simulations_path(@simulation)
  end

  def result
    @simulation = Simulation.find(params[:uuid])
  end

  private

  def simulation_params
    params.require(:simulation).permit(:carrier, :terminal_id, :capacity, :voice, :sms, :speed)
  end
end
