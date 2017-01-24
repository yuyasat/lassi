class Api::V1::PartiesController < ApplicationController
  def parties
    date = Date.parse(params[:date])
    parties = Party.active(date)

    date_string = date.strftime('%Y-%m-%d')
    respond_to do |format|
      format.json { render json: { date: date_string, parties: parties.pluck(:official_name) } }
    end
  rescue
    respond_to do |format|
      format.json { render json: { error: 'Invalid Date' } }
    end
  end
end
