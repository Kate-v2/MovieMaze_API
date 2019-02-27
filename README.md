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
* [MovieMaze API](https://movie-maze.herokuapp.com/)

## Setup
1. Fork or clone this repo: `git clone git@github.com:Kate-v2/MovieMaze.git <name of your choice>`
1. Install Dependencies: `bundle install`
1. Install [Figaro](https://github.com/laserlemon/figaro) to store secret environmental variables:
  1. `bundle exec figaro install`  --> provides `config/application.yml`
1. Get and API token from [Utelly](https://rapidapi.com/utelly/api/utelly?endpoint=59ef20efe4b09ee1ff544377)

1. Add each token to `application.yml` under both `test:` & `development:`
1. `uttely_key: YOUR TOKEN HERE`
1. `omdb_key: YOUR TOKEN HERE`
1. Make sure you add these ENV variables to your deployment service.
1. To see the app in action locally: `rails s` then go to: `http://localhost:3000/`
1. Setup database `bundle exec rake db:{create,migrate}`


## APIs, Data, Services
This app obtains data through:
* [MovieMaze API](https://github.com/Kate-v2/MovieMaze_API)
  * [Utelly](https://rapidapi.com/utelly/api/utelly?endpoint=59ef20efe4b09ee1ff544377)
  * [OMDb](http://www.omdbapi.com/)


## How to Use
1. Use [MovieMaze API](https://movie-maze.herokuapp.com/)

* **New User:** POST https://movie-maze.herokuapp.com/users
```
Headers:
  Content-type: application/json
  Accept: application/json
Body:
{
	"username": "name",
	"password": "pw",
	"password_confirmation": "pw",
	"email": "email"
}
```
```
Response
status: 201
Body:
{
    "data": {
        "id": "100",
        "type": "new_user",
        "attributes": {
            "id": 100,
            "token": "xyz123"
        }
    }
}
```

* **Login User:** POST https://movie-maze.herokuapp.com/sessions
```
Headers:
  Content-type: application/json
  Accept: application/json
Body:
{
	"username": "name",
	"password": "pw"
}
```
```
Response
status: 200
Body:
{
    "data": {
        "id": "100",
        "type": "login",
        "attributes": {
            "id": 100,
            "token": "xyz123"
        }
    }
}
```

* **Search Movie Titles** GET https://movie-maze.herokuapp.com/api/v1/search
```
Headers:
  Content-type: application/json
  Accept: application/json
Body:
{
  "term": "bojack"
}
```
```
Response
status: 200
Body:
{
    "data": {
        "id": "0",
        "type": "movie_search_results",
        "attributes": {
            "id": 0,
            "term": "bojack",
            "results": [
                {
                    "title": "BoJack Horseman",
                    "picture": "https://utellyassets2-9.imgix.net/2/Open/TMDB4_2462/Misc/5u3Y2HpD0wlK697lnpvNn6h5lYK.jpg?fit=crop&auto=compress&crop=faces,top",
                    "streams": [
                        {
                            "service": "Netflix",
                            "url": "https://www.netflix.com/title/70300800"
                        }
                    ]
                },
                {
                    "title": "Dragon Ball Z: Bojack Unbound",
                    "picture": "https://utellyassets2-9.imgix.net/2/Open/MovieDB_2462/Program/19828569/_9by13/19828569_PA_DragonBallZBojackUnbound.jpg?fit=crop&auto=compress&crop=faces,top",
                    "streams": [
                        {
                            "service": "iTunes",
                            "url": "https://itunes.apple.com/us/movie/dragon-ball-z-bojack-unbound/id1371978171?uo=5&at=1l3v7yf"
                        }
                    ]
                },
                {
                    "title": "BoJack Horseman Christmas Special: Sabrina's Christmas Wish",
                    "picture": null,
                    "streams": [
                        {
                            "service": "Netflix",
                            "url": "https://www.netflix.com/title/80019503"
                        }
                    ]
                }
            ]
        }
    }
}
```



## Known Issues


## Running Tests
* To run tests use `bundle exec rspec`
* To open coverage (via simplecov gem) `open coverage/index.html` after you run the tests

## Future Goals
* Incorporate suggestions for user
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
* `Ruby '2.4.1'`
* `Rails '~> 5.2.2'`
* [PostgreSQL](https://www.postgresql.org/) for database
* `'rspec-rails', '~> 3.8'` for testing
* [Travis CI](https://travis-ci.org/)
* [Heroku](https://www.heroku.com/)
* See [Gemfile](https://github.com/Kate-v2/MovieMaze_API/blob/master/Gemfile) for specific gems

## [Turing](https://www.turing.io/) Project Details:
* [Assignment](http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_spec)
* [Rubric](http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_rubric)
