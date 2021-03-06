
require 'awesome_print'
module RideShare
  class Passenger
    attr_reader :id, :name, :phone_number, :trips

    def initialize(input)
      if input[:id] == nil || input[:id] <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      @id = input[:id]
      @name = input[:name]
      @phone_number = input[:phone]
      @trips = input[:trips] == nil ? [] : input[:trips]
    end

    def get_drivers
      @trips.map{ |t| t.driver }
    end

    def add_trip(trip)
      @trips << trip
    end



    def total_amount_of_money
      if !@trip_in_progress
        @trips.reduce(0){|total,trip| total + trip.cost}
      end
    end

    def total_amount_of_time
      if !@trip_in_progress
        @trips.reduce(0){|total,trip| total + trip.duration}
      end
    end

  end
end
