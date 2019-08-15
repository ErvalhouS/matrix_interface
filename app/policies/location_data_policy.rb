# frozen_string_literal: true

# Policy to define how our location data will be accessed
class LocationDataPolicy
  attr_reader :pass, :location

  # Policy is based on passphrase and location data
  def initialize(pass, location)
    @pass = pass
    @location = location
  end

  # Defines the scope of indexing
  class Scope
    attr_reader :pass, :scope

    # Scope is based on passphrase
    def initialize(pass, scope)
      @pass = pass
      @scope = scope
    end

    # Resolves indexing on location data matching passphrase
    def resolve
      pass_id = Pass.where(phrase: pass&.phrase).pluck(:id)
      scope.where(pass_id: pass_id)
    end
  end
end
