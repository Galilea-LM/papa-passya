# frozen_string_literal: true

class Space < ApplicationRecord
  has_many_attached :images
  has_many :events
end
