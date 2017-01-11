module Api
  class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :update, :destroy]

    resource_description do
      short "API for managing People"
    end

    api :GET, '/people', "Fetch all survivors"
    description <<-EOS
    == Fetch survivors
     This API is used to fetch all survivors and his details.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"

    # GET /api/people
    def index
      people = Person.all

      render json: people
    end

    api :GET, '/people/:id', "Fetch single survivor"
    description <<-EOS
    == Fetch single survivor
     This API is used to fetch information about a single survivor
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"

    # GET /people/1
    def show
      render json: @person
    end

    api :POST, '/people', "Create Survivor"
    description <<-EOS
    == Create Survivor
     This API is used to create a new survivor.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"
    param :person, Person do
      param :name, String, :required => true
      param :age, Integer, :required => true
      param :gender, String, :required => true
      param :lonlat, String
      param :items, String, :required => true
    end

    # POST /people
    def create

      @person = Person.new(person_params)

      if @person.save
        render json: @person, status: :created
        update_location(@person.id)
      else
        render json: @person.errors, status: :unprocessable_entity
        render_error(@person, :unprocessable_entity)
      end
    end

    api :PATCH, '/people/:id', "Edit survivor"
    description <<-EOS
    == Edit survivor
     This API is used to edit a survivor.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"
    param :person, Hash, :required => true do
      param :name, String, :required => true
      param :age, Integer, :required => true
      param :gender, String, :required => true
      param :lonlat, String
    end

    # PATCH/PUT /people/1
    def update
      if @person.update(person_params)
        render json: @person, status: :ok
      else
        #render json: @person.errors, status: :unprocessable_entity
        render_error(@person, :unprocessable_entity)
      end
    end

    api :DELETE, '/people/:id', "Delete survivor"
    description <<-EOS
    == Delete Survivor
     This API is used to delete a survivor.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"

    # DELETE /people/1
    def destroy
      @person.destroy
      head 204
    end

    api :GET, '/people/:id/report_infection', "Register infection suspect"
    description <<-EOS
    == Fetch items from survivor
     Used to increase the infection count of a Person.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"
    param :infected, String, :required => true
    param :id, String, :required => true

    # Properties Items
    #todo
    def report_infection

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      begin
        @person = Person.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        user = Person.new
        user.errors.add(:id, "Wrong ID")
        render_error(Person, 404) and return
      end
    end

    # After creating a new user, save the location url with the id
    def update_location(id)

      @person = Person.find(id)
      @person.location = request.original_url + '/' + id.to_s
      @person.save

    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:id, :name, :age, :gender, :lonlat, :items)
    end

  end
end