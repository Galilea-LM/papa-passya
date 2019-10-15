# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  date_start  :datetime         not null
#  date_end    :datetime         not null
#  date        :string           not null
#  description :string           not null
#  company_id  :integer
#  space_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  has_many_attached :images
  belongs_to :space
  belongs_to :company
  has_and_belongs_to_many :users
  include PgSearch
  pg_search_scope :search_by_name, against: :name
  pg_search_scope :search_by_space, against: :space_id
  # pg_search_scope :search_by_tag, against: :tags
  # has_many :actors, through :company
end
# price_min
# price_max
# link to buy
# buy name
# tags
