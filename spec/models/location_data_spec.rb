require 'spec_helper'

describe LocationData do
  describe '#columns' do
    subject { described_class.column_names }

    it do
      is_expected.to eq(
        %w[
          id
          source
          start_node
          end_node
          start_time
          end_time
          pass_id
          created_at
          updated_at
        ]
      )
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:pass).inverse_of(:location_datas) }
  end

  describe 'enums' do
    it do
      is_expected.to define_enum_for(:source)
        .with_values(%i[sentinels sniffers loopholes])
    end
    it do
      is_expected.to define_enum_for(:start_node)
        .with_values(%i[alpha beta gamma delta theta lambda tau psi omega])
        .with_suffix
    end
    it do
      is_expected.to define_enum_for(:end_node)
        .with_values(%i[alpha beta gamma delta theta lambda tau psi omega])
        .with_suffix
    end
  end
end
