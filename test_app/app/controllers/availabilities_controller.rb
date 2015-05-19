class AvailabilitiesController < ApplicationController
  def index
    # TODO get postal code
    # TODO hours needed

    hours_needed = 2
    hours_needed = params[:hours_needed].to_i unless params[:hours_needed].blank?
    post_code = nil
    post_code = params[:post_code] unless params[:post_code].blank?

    date_query = DateTime.now.strftime('%Y-%m-%d')
    date_query_start = DateTime.now.strftime('%Y-%m-%d 00:00:00')
    date_query_end = DateTime.now.strftime('%Y-%m-%d 23:59:59')
    slots_db = Slot.where(post_code: post_code,
                          start_time: date_query_start..date_query_end,
                          end_time: date_query_start..date_query_end)

    reserved_hours = []
    slots_db.each do |slot|
      start_time = slot.start_time.strftime('%H:%M')
      end_time = slot.end_time.strftime('%H:%M')

      reserved_hours += array_between_hours(start_time, end_time)
    end

    available_hours = []
    (8..20).each do |hour|
      %w(00 30).each do |minute|
        start_time = "#{hour.to_s.rjust(2, '0')}:#{minute}"
        end_time = "#{(hour + hours_needed).to_s.rjust(2, '0')}:#{minute}"

        needed_hours = array_between_hours(start_time, end_time)
        if !(reserved_hours & needed_hours).empty? && end_time <= '20:30'
          available_hours << "#{hour}:#{minute}"
        end
      end
    end

    @slots = {}
    @slots[date_query] = available_hours
  end

  private

  def array_between_hours(start_time, end_time)
    hour_start = start_time.split(':')[0]
    hour_end = end_time.split(':')[0]

    array_hours = []
    (hour_start..hour_end).each do |hour|
      %w(00 30).each do |minute|
        time = "#{hour.to_s.rjust(2, '0')}:#{minute}"
        array_hours << time if time >= start_time && time <= end_time
      end
    end

    array_hours
  end
end
