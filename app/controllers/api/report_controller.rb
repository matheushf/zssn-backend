module Api
  class ReportController < ApplicationController
    before_action :set_report, only: [:show, :update, :destroy]

    resource_description do
      short "API for reports"
    end

    api :GET, '/report/infected', "Available reports"
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

    # Methods for each report

    api :GET, '/report/infected', "Average of Infected People"
    description <<-EOS
    == Average of Infected People
     This API returns the average of infected people.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Report not yet created"
    # GET /report/infected
    def infected
      #Average of infected people

    end

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
    def non_infected
      #Average of non-infected (healthy) people

    end

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
    def people_inventory
      #Average of the quantity of items per person (total and just non-infected)
    end

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
    def infected_points
      #Total points lost in items that belong to infected people
    end

  end
end