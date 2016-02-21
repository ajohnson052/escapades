module EscapadesHelper

  #for an object that has a start_date and end_date, get an array of dates
  def get_dates incident
    (incident.start_date..incident.end_date).to_a
  end

  #for a response, get an array that includes all available dates
  def get_availability response
    user_availability = response.availabilities.to_a
    user_availability.map! { |availability| get_dates(availability)}
    user_availability.flatten!
  end

  #for an array of dates, get an array of date ranges
  def get_ranges dates
    ranges = dates.reject do |i|
      dates.include?(i-1) & dates.include?(i+1)
    end
    ranges.each_slice(2).to_a
  end

  #for an escapade, find the intersection of response availabilities
  #return an array of dates
  def all_available escapade
    optimal_dates = get_dates(escapade)
    escapade.responses.each do |response|
      availability = get_availability(response)
      optimal_dates = optimal_dates & availability unless availability.empty?
    end
    optimal_dates
  end

  #for an escapade, get date ranges for which all responses have availability
  def get_optimal_dates escapade
    optimal_dates = all_available(escapade)
    get_ranges(optimal_dates)
  end

end
