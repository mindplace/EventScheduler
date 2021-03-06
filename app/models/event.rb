# == Schema Information
#
# Table name: events
#
#  id            :bigint(8)        not null, primary key
#  name          :string           not null
#  host          :string           not null
#  description   :text
#  location      :string
#  event_type    :string
#  conference_id :bigint(8)
#  starts_at     :datetime
#  ends_at       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Event < ApplicationRecord

  EVENT_TYPES_TO_COLORS = { panel: :blue, outdoor: :green, vip: :purple }
  EVENT_TYPES = EVENT_TYPES_TO_COLORS.keys.map(&:to_s)

  belongs_to :conference

  has_many :event_attendees
  has_many :attendees, through: :event_attendees, source: :conf_attendee

  validates_presence_of(:name, :host, :description, :location, :event_type, :conference, :starts_at, :ends_at)
  validates_inclusion_of :event_type, in: EVENT_TYPES

end
