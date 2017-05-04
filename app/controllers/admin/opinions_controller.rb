class Admin::OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all
  end
end
