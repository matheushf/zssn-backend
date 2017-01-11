module Api
  class PropertiesController < ApplicationController

    api :GET, '/people/:id/properties', "Fetch items from survivor"
    description <<-EOS
    == Fetch items from survivor
     This API is used to fetch all items from survivor.
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"

    # Properties Items
    #todo
    def show

      temp = [
          {
              item: {
                  name: "Not done yet",
                  points: 0
              }
          }
      ]

      render json: temp

    end

    api :GET, '/people/:id/properties/trade_item', "Trade items between survivors"
    description <<-EOS
    == Trade items between survivors
     A transaction can only go through if the value of the traded items are the same
    === No authentication
     No auth is required
    EOS
    formats ['json']
    error :code => 404, :desc => "Survivor not yet created"
    param :person_id, String, :required => true
    param :consumer, Hash, :required => true do
      param :name, String, :required => true
      param :pick, String, :required => true
      param :payment, String, :required => true
    end

    # Properties Items
    #todo
    def trade_item

    end

  end
end