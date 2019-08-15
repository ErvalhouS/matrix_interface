# frozen_string_literal: true

# Web interactions with the location data are controlled within this file.
class LocationDataController < ApplicationController
  before_action :set_pass
  before_action :set_location, only: :create

  def index
    paginate json: LocationDataPolicy::Scope.new(@pass, LocationData).resolve
      .where(source: location_params[:source])
  end

  def create
    if location_will_persist?
      render json: @location, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  # Avoid bad parameters from machines
  def location_params
    params.permit(:passphrase, :source, :start_node, :end_node, :start_time,
                  :end_time)
  end

  # Our users are identified by their passphrases
  def set_pass
    @pass = Pass.where(phrase: params[:passphrase]).first
  end

  def set_location
    @location = @pass.location_datas.new(location_params.except(:passphrase))
  end

  def location_will_persist?
    @location.valid? && @location.delay.save
  end
end
