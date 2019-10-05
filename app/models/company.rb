# frozen_string_literal: true

class Company < ApplicationRecord
  has_one_attached :logo
  has_many :events
end
