# Adopt Don't Shop Spec Harness

Run `bundle install` to install all necessary gems.

Edit your `spec_helper.rb` file and set `HOSTNAME` to the production URL of your Heroku instance.

Your seeds file must be set up to create certain data in order for the tests to pass.

There should be two shelters:

Mike's Shelter, 1331 17th Street Denver, CO 80202

Meg's Shelter, 150 Main Street Hershey, PA 17033

There should be two pets as well, Mike's Shelter has one pet, Athena, 1 year old, female, description: butthead. Meg's Shelter has Odell, 4 years old, M and description: good dog.

You MUST reset and reseed the Heroku database before each time you run this spec harness.

You can run all tests by typing in `rspec` or you can run them individually by typing in, `rspec <filename>`