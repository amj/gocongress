class AttendeeEvent < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :activity
  validates_presence_of :attendee, :activity
  validates :year, :numericality => { :only_integer => true, :greater_than => 2010, :less_than => 2100 }

  before_validation do |ae|
    if ae.activity.year != ae.attendee.year
      raise "#{Attendee.model_name.human} and #{Activity.model_name.human} have different years"
    end
    ae.year ||= ae.attendee.year
  end
end
