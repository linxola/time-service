# frozen_string_literal: true

# Module to manipulate time
module TimeService
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # Class for TimeService configuration
  class Configuration
    attr_accessor :day_start, :day_end

    def initialize
      @day_start = '9:00 AM'
      @day_end = '6:00 PM'
    end
  end

  # Class for calculating the time
  class Time < Configuration
    def add_minutes(time_string, added_minutes)
      time_minutes = convert_to_minutes(time_string)
      result_minutes = time_minutes + added_minutes
      result_minutes -= 1440 if result_minutes >= 1440
      convert_to_time_string(result_minutes)
    end

    private

    def convert_to_minutes(time_string)
      parsed_time = time_string.split(/[:\s]/)
      time = (parsed_time[0].to_i * 60) + parsed_time[1].to_i
      parsed_time.last == 'PM' ? time + 720 : time
    end

    def convert_to_time_string(minutes)
      if minutes < 720
        "#{minutes / 60}:#{format_minutes(minutes)} AM"
      else
        minutes -= 720
        "#{minutes / 60}:#{format_minutes(minutes)} PM"
      end
    end

    def format_minutes(minutes)
      minutes % 60 < 10 ? "0#{minutes % 60}" : (minutes % 60).to_s
    end
  end
end
