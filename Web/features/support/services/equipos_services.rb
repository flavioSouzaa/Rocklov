require_relative "base_service"

class EquiposServices < BaseService
    def create(equipo, user_id)
        payload = equipo

        self.class.post(
            "/equipos",
            body: payload,
            headers: {
                "user_id": user_id, 
            },
        )
    end

    def booking(equipo_id, user_locator_id)
        return self.class.post(
            "/equipos/#{equipo_id}/bookings",
            body: { data: Time.now.strftime("%d/%m/%Y")}.to_json,
            headers: {
                "content-type": "application/json",
                "user_id": user_locator_id,
            },
        )
    end
end