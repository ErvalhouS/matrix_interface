require 'rails_helper'

RSpec.describe LocationDataController, type: :controller do
  let!(:pass) { create(:pass) }

  describe 'GET #index' do
    let!(:location) { create(:location_data, pass: pass) }

    context 'with a valid passphrase' do
      before { get :index, params: { passphrase: pass.phrase, source: location.source } }

      it 'renders a json array with the searched location' do
        expect(response.body).to eq [location].to_json
      end
      it 'responds with 200 status' do
        expect(response.status).to eq 200
      end
    end

    context 'with a invalid passphrase' do
      before { get :index, params: { passphrase: 'I am a machine', source: location.source } }

      it 'renders a empty json array' do
        expect(response.body).to eq [].to_json
      end
    end
  end

  describe 'POST #create' do
    let!(:params) do
      attributes_for(:location_data).except(:created_at, :updated_at).as_json
    end

    before do
      put :create,
          params: params.merge(passphrase: pass.phrase)
    end

    context 'with a valid location_data' do
      it 'returns the created location data attributes' do
        expect(JSON.parse(response.body).except('id', 'created_at', 'updated_at')).to eq params.merge('pass_id' => pass.id)
      end

      it 'responds with 201 status' do
        expect(response.status).to eq 201
      end
    end

    xcontext 'with a invalid location data' do
      it 'responds with 422 status' do
        expect(response.status).to eq 422
      end
    end
  end
end
