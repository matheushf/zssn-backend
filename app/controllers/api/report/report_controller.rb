module Api
  module Report
    class ReportController < ApplicationController
      before_action :set_report, only: [:show, :update, :destroy]

      resource_description do
        short "API for reports"
      end

      api :GET, '/report', "Available reports"
      description <<-EOS
    == Available reports
     This API returns the list of available reports.
    === No authentication
     No auth is required
      EOS
      formats ['json']
      error :code => 404, :desc => "Report not yet created"

      # GET /report
      def index
        # Show all the report api url's
        @reports = [
            "http://zssn-backend-example.herokuapp.com/api/report/infected",
            "http://zssn-backend-example.herokuapp.com/api/report/non_infected",
            "http://zssn-backend-example.herokuapp.com/api/report/people_inventory",
            "http://zssn-backend-example.herokuapp.com/api/report/infected_points"
        ]
        render json: @reports
      end

    end
  end
end