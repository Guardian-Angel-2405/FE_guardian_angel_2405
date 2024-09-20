# Project Title
‘Guardian Angel’ is a full stack Rails application that will allow users to create an account and gain access to resources that can boost mental health and/or help in times of crisis. Users will be able to select from a list of emotions and feelings as many times per day as they wish. By accessing the ‘ThroughLine API’, a list of helpful resources will be returned to the user, including, but not limited to, phone numbers, sms hotlines, support groups, and relevant, helpful websites. 
## Getting Started
These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on deploying the project on a live system.
### Prerequisites
You will need to have the Ruby 3.2.2 and Rails 7.1.4. This project utilizes the ThroughLine API which is consumed by a separate backend application. 
- [ThroughLine]([https://www.example.com](https://api.throughlinecare.com/users/sign_in))
- [Guardian Angel BE Repository](https://github.com/Guardian-Angel-2405/BE_API_guardian_angel_2405)
### Installing
To install and use this repository on your local machine first clone down this repository, and clone down the [Guardian Angel BE Repository](https://github.com/Guardian-Angel-2405/BE_API_guardian_angel_2405) repository.
Navigate through the console so that your are in the directories of each application (you will need two terminals open).
Run `rails db:{create,migrate}` to establish the database. Then run `bundle install` to install all the gem dependencies. 
Following this run `rails s` in each terminal. You should ensure that each console is running on a separate `localhost` number. For example, `localhost:3000` for the backend repository and `localhost:4567` for the frontend. 
Then in your browser type in `localhost:fe_repo_port_number` and you will be good to use the application. By default the backend application should be `localhost:4567`.

Alternatively you can utilize the deployed version of the site here: (link will be placed soon)

## Running the tests
To run the tests for this repository, simply run `bundle exec rspec spec` from the command line while in the Guardian Angel projects directory. This will run all test files for the application. 
## Deployment
Add additional notes to deploy this on a live system
## Built With
  - [Contributor Covenant](https://www.contributor-covenant.org/) - Used
    for the Code of Conduct
  - [Creative Commons](https://creativecommons.org/) - Used to choose the license
  - [ThroughLine]([https://www.example.com](https://api.throughlinecare.com/users/sign_in))
  - [Guardian Angel Sinatra BE Repository](https://github.com/Guardian-Angel-2405/BE_API_guardian_angel_2405)
  - [Guardian Angel Journal BE Repository](https://github.com/Guardian-Angel-2405/BE_JOURNAL_guardian_angel_2405)
## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code
of conduct, and the process for submitting pull requests to us.
## Versioning
We use [Semantic Versioning](http://semver.org/) for versioning. For the versions
available, see the [tags on this
repository](https://github.com/PurpleBooth/a-good-readme-template/tags).
## Authors & Contributors 
- **Austin Kenny** - *BE and FE Engineer* -
    [GitHub](https://github.com/AustinKCodes)
- **Cory Bretsch** - *BE and FE Engineer* -
    [GitHub](https://github.com/CoryBretsch)
- **Dana Howell** - *BE and FE Engineer* -
    [GitHub](https://github.com/DHowell1150)
- **Evan Davis** - *BE and FE Engineer* -
    [GitHub](https://github.com/DAVISEVAN)
- **Lance Nelson** - *BE and FE Engineer* -
    [GitHub](https://github.com/LancePants97)
- **Jan Lehigh** - *BE and FE Engineer* -
    [GitHub](https://github.com/JCL461437)
- **Tyler Noble** - *BE and FE Engineer* -
    [GitHub](https://github.com/tnoble-cmd)
- **Kat Brandt** - *BE and FE Project Manager* -
## License
This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details
## Acknowledgments
