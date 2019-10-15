# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @items = %w[companies events spaces]
  end
end
