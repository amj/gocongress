class Tournament < ActiveRecord::Base
  include YearlyModel

  attr_accessible :description, :directors, :eligible, :location,
    :name, :openness, :show_attendee_notes_field, :show_in_nav_menu

  has_many :rounds, :dependent => :destroy
  has_many :attendee_tournaments, :dependent => :destroy
  has_many :attendees, :through => :attendee_tournaments

  accepts_nested_attributes_for :rounds, :allow_destroy => true

  # Openness Types:
  # Open - All attendees can sign up
  # Invitational - Admins select certain attendees
  OPENNESS_TYPES = [['Open','O'], ['Invitational','I']]

  validates_presence_of :name, :eligible, :description, :directors, :openness
  validates_length_of :openness, :is => 1
  validates_inclusion_of :openness, :in => OPENNESS_TYPES.flatten
  validates :location, :length => {:maximum => 50}

  # Scopes, and class methods that act like scopes
  scope :nav_menu, where(:show_in_nav_menu => true)
  def self.openness(o) where(:openness => o) end

  def get_openness_type_name
    openness_name = ''
    OPENNESS_TYPES.each { |t| if (t[1] == self.openness) then openness_name = t[0] end }
    if openness_name.empty? then raise "assertion failed: invalid openness type" end
    return openness_name
  end

  def has_rounds?
    rounds.count > 0
  end
end
