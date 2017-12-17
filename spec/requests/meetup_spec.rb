require 'rails_helper'

RSpec.describe "API_V1::Meetups", :type => :request do
  before do
    @user = User.create!( :email => "test@example.com", :password => "12345678",:is_admin=>true)
    @title = "Jingan 10th Meetup"
    @date = "2017-04-15" #notice

    @description = "This will be an exciting meetting"
    Meetup.create!(:title => @title,:meetup_time=>@date.to_date,:description=>@description)
  end

  example "GET /api/v1/meetups?auth_token=" do
    get "/api/v1/meetups?auth_token=#{@user.authentication_token}"
    expect(response).to have_http_status(200)
    expected_result = {
      "data":[
        "title": @title,
        "meetup_time": @date.to_date
      ]
    }

    expect(response.body).to eq( expected_result.to_json )
  end
end
