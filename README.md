# wdi_project_2

This was a group project, we chose to create a communtiy coffeeshop review app, where users can add the coffeeshops. using google maps and gelocation users can also search coffeeshop in their general location.  

Preparation:

Method: agile;
Time available: 1 week;
Team: three developers;
Trello: https://trello.com/b/jKZHD41z/wdi-2-prj-cheryl-james-elena

Scope:

  I - user registration 
  II - cafés registering 
  III - rating the cafés 
  IV - map of cafes 
Necessary:

user registration: devise/oauth 
pictures upload: carrierwave 
cafes adding: google APIs, autocomplete 
qualities of cafes: boxes to be ticked of/tags 
reviews: cancancan to enable users to add user reviews (commentator maybe?), user ratings 0/5 

Plus:


haml; 
sass (bourbon); 
mobile responsive styling; 



User stories:

Persona no.1: name: Peter
occ: student
age: 18
device: iPhone
status: not registered user

Peter wants to: find a quiet place to study, get food, use his laptop, search for a coffee shop in the homepage

How: 
A map of all the cafes of london in his homepage

What if he wants to narrow down the research?
He searches by tags
He sees dots on the map + a list of cafes
He clicks the button of the cafes/or the link on the list
He lands on specific cafe page
He sees reviews, ratings, tags
END

Persona no.2: name: Amy
occ: banker
age: 27
device: htc 1

Amy wants to: sign up, add a new cafe, review it
She goes to 'sign up through fb'
She goes to 'add a new cafe’
She lands on the form

Cafe name,
Location (address, could be name)(autocomplete), Picture, Tags

after creating it: page links to review the item she just added

(in case peter has already created the cafe, she will be redirected to the add a review page)
END

Persona no.3: name: Pierre
occ: freelancer
age: 35
device: lg/mac

Pierre wants to: review Amy’s cafe

has to log in
searches for cafes he’s been in
finds Amy’s cafe, he’s been there, he wants to review it
in the cafe’s page he sees the link to upload a comment + rating
he writes his review, saves
he sees his review appear on the page
END



see the app: ~http://desolate-scrubland-1261.herokuapp.com/~




Thank you for reading!
