# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - ActiveRecord is loaded in the Gemfile, used to construct all the models and relationships as well as many of the model methods.
- [x] Include more than one model class (e.g. User, Post, Category) - 4 models are included: User, Portfolio, Repo, and PortfolioDisplay
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - the User model has many Portfolios
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - a Portfolio belongs to a User, a Repo belongs to a User and a Portfolio Display belongs to a Portfolio.
- [x] Include user accounts with unique login attribute (username or email) - uniqueness was implemented using the ActiveRecord uniqueness macro as well as associated logic in the user controller.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - CRUD was implemented on the Portfolio and Portfolio Display models. Destroying, however was not implemented on the Repo model because the Repo model serves as a layer for actual github repos and it does not make sense to let a user destroy a Repo instance when it would still exist on Github.
- [x] Ensure that users can't modify content created by other users - This was implemented for Portolios and Repos using the `#redirect_if_not_user` helper method defined in the main application controller. I did not have time to implement this for portfolio_displays but may do so after submission
- [x] Include user input validations - input validations were completed using ActiveRecord macros, and I created a custom validation for github_username attribute that checks to see if a github username exists via the github api 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - validation failures are displayed via the rack-flash gem
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
