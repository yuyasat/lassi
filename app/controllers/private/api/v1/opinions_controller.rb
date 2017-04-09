class Private::Api::V1::OpinionsController < ApplicationController
  def create
    Opinion.create!(opinion_params.merge(ip: request.ip, user_agent: request.user_agent))
    head :ok
  rescue
    head :internal_server_error
  end

  private

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
