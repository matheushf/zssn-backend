module Api
  class ReportController < ApplicationController
    before_action :set_report, only: [:show, :update, :destroy]

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

    # GET /report/infected
    def infected
      #Average of infected people

    end

    # GET /report/non_infected
    def non_infected
      #Average of non-infected (healthy) people

    end

    # GET /report/people_inventory
    def people_inventory
      #Average of the quantity of items per person (total and just non-infected)
    end

    # GET /report/infected_points
    def infected_points
      #Total points lost in items that belong to infected people
    end

  end
end