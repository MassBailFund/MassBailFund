# Mass Bail Fund

This is an in-progress re-write of the client referral and admin panel for Mass Bail Fund.

## Important Dependencies

Tool                | Description
------------------- | -----------
[Rails]             | Batteries included web application framework
[Devise]            | Powerful user authentication/activation/password resets
[CanCanCan]         | Define abilities for users in one place
[PaperTrail]        | Keeps a history of model changes
[SimpleForm]        | A Rails form builder plugin

[Rails]: https://github.com/rails/rails
[Devise]: https://github.com/plataformatec/devise
[CanCanCan]: https://github.com/CanCanCommunity/cancancan
[PaperTrail]: https://github.com/airblade/paper_trail
[SimpleForm]: https://github.com/plataformatec/simple_form

### Important Development Dependencies

Tool                | Description
------------------- | -----------
[FactoryGirl]       | Easily create models to test with
[Faker]             | Generate realistic looking fake data

[FactoryGirl]: https://github.com/thoughtbot/factory_girl
[Faker]: https://github.com/stympy/faker

## Models

![Entity-Relationship Diagram](spec/fixtures/images/erd.png)
(To update this image after the schema changes run `bundle exec erd`)

The models are currently a work in progress. We are waiting to look at the
current schema before making decisions on how to model things.

## Deployment

We are currently using Heroku to deploy. Heroku's [docs on getting set up are pretty thorough, and are located here](https://devcenter.heroku.com/articles/git).

You will need to take a couple of extra steps if this is your first time provisioning and deploying to a new environment. The dummy user the app's initialized with will draw its password from an environment variable `MA_BAIL_USER_PASSWORD`. You'll also need to install the cleardb add-on (here)[https://devcenter.heroku.com/articles/cleardb] in order to use MySQL, and follow the instructions for the mysql2 gem in order to get your database url. Then, you'll need to make an environment variable with that as the value and the key `DATABASE_URL`. You will also, if this is a first deployment, want to run rake db:migrate and rake db:seed to populate dropdowns, etc.
