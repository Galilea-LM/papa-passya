# frozen_string_literal: true

class Event < ApplicationRecord
  has_many_attached :images
  belongs_to :space
  belongs_to :company
  #has_many :actors, through :company
end
