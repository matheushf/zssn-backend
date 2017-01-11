module Api
  module Report
    class NonInfectedController < ApplicationController
      api :GET, '/report/non_infected', "Average of Non-infected people"
      description <<-EOS
    == Average of non-infected People
     This API returns the average of Non-infected people
    === No authentication
     No auth is required
      EOS
      formats ['json']
      error :code => 404, :desc => "Report not yet created"
      # GET /report/non_infected
      def index
        #Average of non-infected (healthy) people

        report = {
            report: {
                description: 'Average of non-infected (healthy) people',
                average_healthy: "not done yet"
            }
        }

        render json: report
      end
    end
  end
end