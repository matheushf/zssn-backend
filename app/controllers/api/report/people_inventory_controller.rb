module Api
  module Report
    class PeopleInventoryController < ApplicationController

      api :GET, '/report/people_inventory', "Average of quantity of items per person"
      description <<-EOS
    == Average of Infected People
     This API returns the average of the quantity of items per person (total and just non-infected)
    === No authentication
     No auth is required
      EOS
      formats ['json']
      error :code => 404, :desc => "Report not yet created"
      # GET /report/people_inventory
      def index
        #Average of the quantity of items per person (total and just non-infected)

        report = {
            report: {
                description: 'Average of the quantity of items per person (total and just non-infected)',
                average_items_quantity_per_person: "not done yet",
                average_items_quantity_per_healthy_person: "not done yet"
            }
        }

        render json: report
      end

    end
  end
end