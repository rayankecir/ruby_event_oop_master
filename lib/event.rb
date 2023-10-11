require 'time'
require 'pry'

class Event
  attr_accessor :start_date, :duration, :title, :attendees
  @@all_users = []

  def initialize(start_date, duration, title, attendees)
    if start_date.is_a?(String)
      @start_date = Time.parse(start_date)
      @duration = duration
      @title = title
      @attendees = attendees
      @@all_users << self
    else
      @start_date = start_date
    end
  end

  def postpone_24h
    @start_date = @start_date + 86400
  end

  def end_date
    @start_date + (@duration * 60)
  end

  def is_past?
    start_date = self.start_date
    current_time = Time.now
    start_date < current_time
  end

  def is_future?
    start_date = self.start_date
    current_time = Time.now
    start_date > current_time
  end

  def is_soon?
    current_time = Time.now
    @start_date < (current_time + 30 * 60)
    @start_date > current_time && @start_date <= future_time
  end

  def to_s
    puts "> Titre: #{@title}"
    puts "> Date de début: #{@start_date}"
    puts "> Durée: #{@duration}min"
    puts "> Invités: #{attendees}"
  end

  def self.all
    return @@all_users
  end
end