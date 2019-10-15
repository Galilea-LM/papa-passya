# frozen_string_literal: true

# == Schema Information
#
# Table name: events_users
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  event_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventsUsers < ApplicationRecord
  belongs_to :users
  belongs_to :events
end
