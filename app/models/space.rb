# frozen_string_literal: true

# == Schema Information
#
# Table name: spaces
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  address     :string           not null
#  place       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Space < ApplicationRecord
  has_many_attached :images
  has_many :events
end
