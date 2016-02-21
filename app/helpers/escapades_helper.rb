module EscapadesHelper

  def get_dates incident
    (incident.start_date..incident.end_date).to_a
  end

  def get_availability response
    user_availability = response.availabilities.to_a
    user_availability.map! { |availability| get_dates(availability)}
    user_availability.flatten!
  end

  def convert_to_range dates
    range = dates.reject do |i|
      dates.include?(i-1) & dates.include?(i+1)
    end
    range
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
    optimal_dates = convert_to_range(optimal_dates)
    optimal_dates = optimal_dates.each_slice(2).to_a
  end

end
