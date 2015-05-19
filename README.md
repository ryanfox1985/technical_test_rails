#Scheduling Query

Observe the booking process at www.getyourhero.com (select spain as country, you can choose english as language) up until you can see and select all available timeslots for your cleaning
I want to be able to show my users all time slots that are available for their specific cleaning for a giving time period
Once the customer has selected and booked his cleaning, the time slot shall not be available anymore for other potential customers

#Theoretical Tasks
Explain shortly how you will do the following (make appropriate drawings or documentation):
- Identify all necessary parameter that are transmitted to the backend end-point, in order to receive all available time slots
- Clarify in which step the backend function should be called
- Under which circumstances is it necessary to recall the function?
- Roughly sketch out the data model (table structure) of this particular part of the application


Api end point:
https://api9998.getyourhero.com/api/availability/:post_code/:hours_needed/0

(__Note:__ normally the controllers for convention are in plural)

API examples:

![Request](https://raw.githubusercontent.com/ryanfox1985/technical_test_rails/request.png "Request") <br />
![Response](https://raw.githubusercontent.com/ryanfox1985/technical_test_rails/request.png "Response")

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
- Implement the API end-point for querying the availability in one module in RoR
- Implement the function that adjusts the availability according to the booking for upcoming bookings requests

```
rake db:create
rake db:migrate
rake db:seed

rails s

#Example get url:
curl http://localhost:3000/availabilities/1111/2/0.json
```

Limitations:
- Not contemplate half hour in Availabilities controller
- Only postal code 1111 has reservations
- Only have availabilities for today
