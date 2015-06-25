class DailySchedule < ActiveRecord::Base
  belongs_to :restaurant

  serialize :hours   ### gets a more complicated data structure to be able to be inputed into the database
  before_create :set_hours


  protected

    def set_hours
      self.hours ||= []
    end
end
