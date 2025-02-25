class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def take_ride
        # byebug
        if user.height < attraction.min_height && user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            
            new_tickets = user.tickets - attraction.tickets
            new_nausea = user.nausea + attraction.nausea_rating
            new_happiness = user.happiness + attraction.happiness_rating
            
            user.update(
                :happiness => new_happiness,
                :nausea => new_nausea,
                :tickets => new_tickets
            )

            "Thanks for riding the #{attraction.name}!"
        end

    end
end
