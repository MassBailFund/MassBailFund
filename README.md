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
