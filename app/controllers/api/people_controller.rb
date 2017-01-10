module Api
  class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :update, :destroy]

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:id, :name, :age, :gender, :lonlat, :items)
    end

    # GET /api/people
    def index
      people = Person.all

      render json: people
    end

    # GET /people/1
    def show
      render json: @person
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

    # PATCH/PUT /people/1
    def update
      if @person.update(person_params)
        render json: @person, status: :ok
      else
        #render json: @person.errors, status: :unprocessable_entity
        render_error(@person, :unprocessable_entity)
      end
    end

    # DELETE /people/1
    def destroy
      @person.destroy
      head 204
    end

    # Properties Items
    def properties

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

  end
end