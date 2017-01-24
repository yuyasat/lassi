require 'rails_helper'

RSpec.describe 'parties', type: :request do
  describe 'GET /api/v1/pqrties.json' do
    context 'date is valid format' do
      before { get '/api/v1/parties.json?date=2015-11-21' }

      it 'get parties at 2015-11-21' do
        json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(json['date']).to eq '2015-11-21'
        expect(json['parties']).to contain_exactly(
          'おおさか維新の会', '公明党', '新党改革', '日本を元気にする会', '日本共産党',
          '次世代の党', '民主党', '生活の党と山本太郎となかまたち', '社会民主党', '維新の党',
          '自由民主党'
        )
      end
    end

    context 'date is invalid format' do
      before { get '/api/v1/parties.json?date=2015-13-1' }

      it 'get error at 2015-13-1' do
        json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(json['error']).to eq 'Invalid Date'
      end
    end
  end
end
