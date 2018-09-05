- This is a prototype version of Raye7 Application
- there are two registration systems, the first one was created from scratch (totally from scratch) everything from registration, login, validation, verification, authentication and authorization, and this was the users regestration system, the second one is the activeadmin gem regisration system (I created active admin to be able edit and control whole project database), and that was created using devise gem
- places available as source or destination are only the ones placed inside the place table first, couldn't figure out a way to find the longitude and latitude in the place model, unless the place was added in the place model first (users don't add places longitude and latitude.
- Consists of 4 tables placed in the schema: https://www.dbdesigner.net/designer/schema/195931 (I added 3 extra columns to pickup model)
- each user got to be either Driver of Passenger, when swap from one to other, his trips if was driver or his pickups if was passenger before will be deleted
- passenger can delete his pickups, and the seats on the trip booked will be added again
- driver can delete his trips, and all the passengers pickups created will return to the not booked list
- passenger pickups will be booked automatically everytime he visits his profile, if booked it will not be updated, if not booked it will search for an available trip in the range of 2 hours later and 1 hour sooner than the time of the pickup create.
- created using Ruby on rails, html, scss, bootstrap, Javascript, Json


If there was more time:

- I would create more advanced matching between driver and passenger
- I would add funds into the process, involve coupons, etc
- I would add more testing
- I would add review feature
