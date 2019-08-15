require 'spec_helper'

describe Pass do
  describe '#columns' do
    subject { described_class.column_names }

    it do
      is_expected.to eq(
        %w[
          id
          username
          phrase_bidx
          phrase_ciphertext
          created_at
          updated_at
        ]
      )
    end
  end

  describe 'associations' do
    it do
      is_expected.to have_many(:location_datas).dependent(:nullify)
                                               .inverse_of(:pass)
    end
  end
end
