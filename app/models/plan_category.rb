class PlanCategory < ActiveRecord::Base
  has_many :plans
  validates_presence_of :name
  validates_inclusion_of :show_on_prices_page, :in => [true, false]
  validates_inclusion_of :show_on_roomboard_page, :in => [true, false]
end