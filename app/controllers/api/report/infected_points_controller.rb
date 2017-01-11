module Api
  module Report
    class InfectedPointsController < ApplicationController

      api :GET, '/report/infected_points', "Total points lost in items from infected people"
      description <<-EOS
    == Total points lost in items from infected people
     This API returns the total of points lost that belongs to infected people.
    === No authentication
     No auth is required
      EOS
      formats ['json']
      error :code => 404, :desc => "Report not yet created"
      # GET /report/infected_points
      def index
        #Total points lost in items that belong to infected people

        report = {
            report: {
                description: 'Total points lost in items that belong to infected people',
                total_points_lost: "not done yet"
            }
        }

        render json: report
      end

    end
  end
end