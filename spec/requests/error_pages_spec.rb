require 'rails_helper'

class TestController < ApplicationController
  def index
    raise StandardError
  end

  def show
    raise ActiveRecord::RecordNotFound
  end
end

RSpec.describe 'Error Page', type: :request do
  before do
    Rails.application.env_config['action_dispatch.show_detailed_exceptions'] = false
    Rails.application.env_config['action_dispatch.show_exceptions']          = true

    test_routes = -> {
      get '/test/index' => 'test#index'
      get '/test/show' => 'test#show'
    }
    Rails.application.routes.__send__(:eval_block, test_routes)
  end

  after do
    Rails.application.env_config['action_dispatch.show_detailed_exceptions'] = true
    Rails.application.env_config['action_dispatch.show_exceptions']          = false
  end

  describe 'GET /test/index' do
    before { get '/test/index' }
    subject { response.body }
    it { is_expected.to include("We're sorry, but something went wrong (500)") }
  end

  describe 'GET /test/show' do
    before { get '/test/show' }
    subject { response.body }
    it { is_expected.to include("The page you were looking for doesn't exist.") }
  end
end
