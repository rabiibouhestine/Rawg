# Rawg

R API wrapper for [RAWG.io](https://rawg.io/)

Rawg is an R package which provides access to the RAWG.io API. Complete functionality of the API is supported.

## Installation

### Github

Install via Github

```R
install.packages("devtools")

library(devtools)

install_github("rabiibouhestine/Rawg")
```

### CRAN

Install via CRAN

```R
install.packages("Rawg")
```

## Getting Started

#### Example


```R
library(Rawg)

creator_roles_list("my_app_name")

```

#### Output

id | name | slug
------------- | ------------- | -------------
1 | writer | writer
2 | director | director
3 | composer | composer
4 | artist | artist
5 | producer | producer
6 | designer | designer
7 | programmer | programmer

## Documentation for API Endpoints

All URIs are relative to *https://api.rawg.io/api*

Function | HTTP request | Description
------------- | ------------- | -------------
creator_roles_list | **GET** /creator-roles | Get a list of creator positions (jobs).
creators_list | **GET** /creators | Get a list of game creators.
creators_read | **GET** /creators/{id} | Get details of the creator.
developers_list | **GET** /developers | Get a list of game developers.
developers_read | **GET** /developers/{id} | Get details of the developer.
games_achievements_read | **GET** /games/{id}/achievements | Get a list of game achievements.
games_additions_list | **GET** /games/{id}/additions | Get a list of DLC&#39;s for the game, GOTY and other editions, companion apps, etc.
games_development_team_list | **GET** /games/{id}/development-team | Get a list of individual creators that were part of the development team.
games_game_series_list | **GET** /games/{id}/game-series | Get a list of games that are part of the same series.
games_list | **GET** /games | Get a list of games.
games_movies_read | **GET** /games/{id}/movies | Get a list of game trailers.
games_parent_games_list | **GET** /games/{id}/parent-games | Get a list of parent games for DLC&#39;s and editions.
games_read | **GET** /games/{id} | Get details of the game.
games_reddit_read | **GET** /games/{id}/reddit | Get a list of most recent posts from the game&#39;s subreddit.
games_screenshots_list | **GET** /games/{id}/screenshots | Get screenshots for the game.
games_sitemap_read | **GET** /games/sitemap | Get The Sitemap Games list.
games_stores_list | **GET** /games/{id}/stores | Get links to the stores that sell the game.
games_suggested_read | **GET** /games/{id}/suggested | Get a list of visually similar games.
games_twitch_read | **GET** /games/{id}/twitch | Get streams on Twitch associated with the game .
games_youtube_read | **GET** /games/{id}/youtube | Get videos from YouTube associated with the game.
genres_list | **GET** /genres | Get a list of video game genres.
genres_read | **GET** /genres/{id} | Get details of the genre.
platforms_list | **GET** /platforms | Get a list of video game platforms.
platforms_lists_parents_list | **GET** /platforms/lists/parents | Get a list of parent platforms.
platforms_read | **GET** /platforms/{id} | Get details of the platform.
publishers_list | **GET** /publishers | Get a list of video game publishers.
publishers_read | **GET** /publishers/{id} | Get details of the publisher.
stores_list | **GET** /stores | Get a list of video game storefronts.
stores_read | **GET** /stores/{id} | Get details of the store.
tags_list | **GET** /tags | Get a list of tags.
tags_read | **GET** /tags/{id} | Get details of the tag.




## API Docs

**Link**: https://rawg.io/apidocs

## Documentation For Authorization

RAWG API does not require authorization. You must however set the parameter app_name to your app name in any function you use.

## Other libraries

**Python**: uburuntu/[rawg](https://github.com/uburuntu/rawg)

**Python**: laundmo/[rawgpy](https://pypi.org/project/rawgpy)

**Node.js**: orels1/[rawger](https://github.com/orels1/rawger)
