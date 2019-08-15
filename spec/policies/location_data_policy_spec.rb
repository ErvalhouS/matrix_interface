require 'rails_helper'

RSpec.describe LocationDataPolicy do
  subject { described_class.new(pass, location_data) }

  let(:pass) { create(:pass) }
  let(:bad_pass) { create(:pass) }
  let(:location_data) { create(:location_data, pass: pass) }

  context 'using a valid pass' do
    let(:resolved_scope) do
      described_class::Scope.new(pass, LocationData.all).resolve
    end

    it 'includes location data on scope' do
      expect(resolved_scope).to include(location_data)
    end
  end

  context 'using a bad pass' do
    let(:resolved_scope) do
      described_class::Scope.new(bad_pass, LocationData.all).resolve
    end
    it 'does not include location data on scope' do
      expect(resolved_scope).not_to include(location_data)
    end
  end
end
