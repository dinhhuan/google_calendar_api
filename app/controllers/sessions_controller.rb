class SessionsController < ApplicationController
  def create
	@auth = request.env["omniauth.auth"]
	#Use the token from the data to request a list of calendars
	@token = @auth["credentials"]["token"]	 
	client = Google::APIClient.new
	client.authorization.access_token = @token
	service = client.discovered_api("calendar", "v3")
	result = client.execute(:api_method => service.calendar_list.get,
	  :parameters => {"calendarId" => "vi.vietnamese#holiday@group.v.calendar.google.com"} )
    result1 = client.execute(:api_method => service.events.list,
      parameters: {"calendarId" => "vi.vietnamese#holiday@group.v.calendar.google.com",
                    "timeMin" => "2014/09".to_datetime.beginning_of_month, timeMax: "2014/09".to_datetime.end_of_month
		})
        result3 = client.execute(:api_method => service.events.list,
                    :parameters => {'calendarId' => 'ja.japanese#holiday@group.v.calendar.google.com',
                    	'timeMin' => "2014/05".to_datetime.beginning_of_month, 'timeMax' => "2014/05".to_datetime.end_of_month
	})
    result2 = client.execute(:api_method => service.calendars.get,
      :parameters => {'calendarId' => 'vi.vietnamese#holiday@group.v.calendar.google.com'}
  end
	 
  def destroy
	session[:user_id] = nil
	redirect_to root_path
  end
end
