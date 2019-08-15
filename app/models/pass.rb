# This model encapsulates the behavior for passphrases.
class Pass < ApplicationRecord
  has_many :location_datas, inverse_of: :pass, dependent: :nullify
  encrypts :phrase
  blind_index :phrase
end
