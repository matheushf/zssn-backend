module Api
  module Report
    class InfectedController < ApplicationController

      api :GET, '/report/infected', "Average of Infected People", :show_in => ReportController
      description <<-EOS
    == Average of Infected People
     This API returns the average of infected people.
    === No authentication
     No auth is required
      EOS
      formats ['json']
      error :code => 404, :desc => "Report not yet created"

      # GET /report/infected
      #todo
      def index
        #Average of infected people

        report = {
            report: {
                description: 'Average of infected people',
                average_infected: "not done yet"
            }
        }

        render json: report

      end

    end
  end
end