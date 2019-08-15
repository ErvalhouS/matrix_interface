# This model encapsulates the behavior for location data received.
class LocationData < ApplicationRecord
  belongs_to :pass, inverse_of: :location_datas

  enum source: %i[sentinels sniffers loopholes]
  enum start_node: %i[alpha beta gamma delta theta lambda tau psi omega],
       _suffix: true
  enum end_node: %i[alpha beta gamma delta theta lambda tau psi omega],
       _suffix: true
end
