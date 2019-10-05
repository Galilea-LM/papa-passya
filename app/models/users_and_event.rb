# frozen_string_literal: true

# == Schema Information
#
# Table name: users_and_events
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  event_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersAndEvent < ApplicationRecord
  belongs_to :users
  belongs_to :events
end
