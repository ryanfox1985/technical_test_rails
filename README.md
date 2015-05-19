#Scheduling Query

1. Observe the booking process at www.getyourhero.com (select spain as country, you can choose english as language) up until you can see and select all available timeslots for your cleaning
2. I want to be able to show my users all time slots that are available for their specific cleaning for a giving time period
3. Once the customer has selected and booked his cleaning, the time slot shall not be available anymore for other potential customers

#Theoretical Tasks
Explain shortly how you will do the following (make appropriate drawings or documentation):

1. Identify all necessary parameter that are transmitted to the backend end-point, in order to receive all available time slots
2. Clarify in which step the backend function should be called
3. Under which circumstances is it necessary to recall the function?
4. Roughly sketch out the data model (table structure) of this particular part of the application


Api end point:
https://api9998.getyourhero.com/api/availability/:post_code/:hours_needed/0

(__Note:__ normally the controllers for convention are in plural)

API examples:

- Request:
![Request](https://raw.githubusercontent.com/ryanfox1985/technical_test_rails/master/request.png "Request")
<br />

- Response:
![Response](https://raw.githubusercontent.com/ryanfox1985/technical_test_rails/master/response.png "Response")

The request are called when it modifies any datum in step one details.

The response is a hash in Json:
{ "Date": ["Hour", "Hour"]}

Table structure:
## Slots ##

Field | Type | Description
--- | --- | ---
**post_code** | `string` | User post code
**start_time** | `date_time` | Start date slot
**end_time** | `date_time` | End date slot


#Practical Tasks

1. Implement the API end-point for querying the availability in one module in RoR
2. Implement the function that adjusts the availability according to the booking for upcoming bookings requests

```
cd test_app
rake db:create
rake db:migrate
rake db:seed

rails s

#Example get url:
curl http://localhost:3000/availabilities/1111/2/0.json
```

__Limitations:__
- Not contemplate half hour at hours_needed parameter in Availabilities controller
- Only postal code 1111 has reservations (seeds.rb)
- Only have availabilities for today
