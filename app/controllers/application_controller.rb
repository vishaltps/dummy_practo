# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CommonMethods
  before_action :doorkeeper_authorize!
end
