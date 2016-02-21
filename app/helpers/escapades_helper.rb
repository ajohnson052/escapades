module EscapadesHelper

  def get_dates incident
    (incident.start_date..incident.end_date).to_a
  end

  def get_availability response
    user_availability = response.availabilities.to_a
    user_availability.map! { |availability| get_dates(availability)}
    user_availability.flatten!
  end

  def get_ranges dates
    ranges = dates.reject do |i|
      dates.include?(i-1) & dates.include?(i+1)
    end
    ranges.each_slice(2).to_a
  end

  def all_available escapade
    optimal_dates = get_dates(escapade)
    escapade.responses.each do |response|
      user_availability = get_availability(response)
      optimal_dates = optimal_dates & user_availability unless user_availability.empty?
    end
    optimal_dates
  end

  def get_optimal_dates escapade
    optimal_dates = all_available(escapade)
    get_ranges(optimal_dates)
  end

end
