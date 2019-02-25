This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

* ...


# MovieMaze

**MovieMaze** is an app to to look up a movie, see it's information, and see what streaming services it's available on. This is the custom API that feeds the MoveMaze App ([Live]()  -- [Repo](https://github.com/Kate-v2/MovieMaze)  )


#### Check it in action!
* [APP]()
* [API]()

## Setup
1. Fork or clone this repo: `git clone git@github.com:Kate-v2/MovieMaze.git <name of your choice>`
1. Install Dependencies: `bundle install`
1. Install [Figaro](https://github.com/laserlemon/figaro) to store secret environmental variables:
  1. `bundle exec figaro install`  --> provides `config/application.yml`
1. Get and API token from [Utelly](https://rapidapi.com/utelly/api/utelly?endpoint=59ef20efe4b09ee1ff544377)

1. Add each token to `application.yml` under both `test:` & `development:`
  1. `uttely_key= YOUR TOKEN HERE`
  1. `omdb_key= YOUR TOKEN HERE`
1. Make sure you add these ENV variables to your deployment service.
1. To see the app in action locally: `rails s` then go to: `http://localhost:3000/`


## APIs, Data, Services
This app obtains data through:
* [MovieMaze API](https://github.com/Kate-v2/MovieMaze_API)
  * [Utelly](https://rapidapi.com/utelly/api/utelly?endpoint=59ef20efe4b09ee1ff544377)
  * [OMDb](http://www.omdbapi.com/)


## How to Use
1. Go to [MovieMaze]()


## Known Issues


## Running Tests
To run tests use `npm test`

## Screenshots


## Future Goals
* Incorporate user suggestions
* Incorporate suggestions on each movie page - [TasteDive API](https://tastedive.com/read/api)
* Add a watched button
* Data Visualization for `watched this month` & `watched vs liked`


## How to Contribute
To contribute, see the setup instructions.
* [Open Issues](https://github.com/Kate-v2/MovieMaze/projects/1)
* Create a new branch describing the feature. If you close an issue, include it's number in the branch name.
* Please describe all changes in the Pull Request (to `Master`), and all relative issue cards/actions.
* Please use the Pull Request Template as the baseline for communication - feel free to add more!
* Please update the `README` if anything is affected.


#### Core Unfinished Features
* [FE & BE Project Board](https://github.com/Kate-v2/MovieMaze/projects/1)


## Core Contributors
* [Kate](https://github.com/Kate-v2)

## Technical


## [Turing](https://www.turing.io/) Project Details:
* [Assignment](http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_spec)
* [Rubric](http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_rubric)
