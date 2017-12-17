class Api::V1::TestController < ApiController
    def index
    render :json => {:message => "TEST API" }
  end
end
