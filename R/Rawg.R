#' Makes a GET request to RAWG API
#'
#' @param app_name character. The user app name. Missing values are not allowed. Every API request should have a User-Agent
#' header with your app name. If you don't provide it, rawg.io may ban your requests.
#' To do this, just pass your app name in the app_name parameter in any function you use in this package.
#' @param dataframe a logical, i.e., one of FALSE or TRUE, indicating whether to return the response as a data.frame.
#' IF FALSE, the result will be a list that matches the API json response.
#' @param ... RAWG API specific parameters, visit https://api.rawg.io/docs/ to learn more..
#' @param request The GET request this function will send to the rawg API.
#' @return The response of the GET request, either as a list or a data.frame.
#' @examples
#' rawg_request("my_app", "creators")
rawg_request <- function(app_name, request, dataframe=TRUE, ...) {

  res <- httr::GET(paste0("https://api.rawg.io/api/", request), query = list(...), httr::add_headers("user-agent" = app_name))
  res_text <- httr::content(res, as="text", encoding="UTF-8")
  res_final <- jsonlite::fromJSON(res_text, flatten = TRUE)

  if (dataframe == TRUE){

    if('results' %in% names(res_final)){

      res_final <- as.data.frame(res_final$results)

    } else{

      res_final <- data.frame(value=unlist(res_final))

      }
  }

  return(res_final)
}










#' Get a list of creator positions (jobs)
#'
#' \code{creator_roles_list} returns a list of creator positions (jobs)
#'
#' @inheritParams rawg_request
#' @examples
#' creator_roles_list("my_app")
creator_roles_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="creator-roles", dataframe=dataframe, ...)
}

#' Get a list of game creators
#'
#' @inheritParams rawg_request
#' @examples
#' creators_list("my_app")
creators_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="creators", dataframe=dataframe, ...)
}

#' Get details of the creator
#'
#' @inheritParams rawg_request
#' @param id creator id.
#' @examples
#' creators_read("my_app", id=1)
creators_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("creators/", id), dataframe=dataframe, ...)
}

#' Get a list of game developers
#'
#' @inheritParams rawg_request
#' @examples
#' developers_list("my_app")
developers_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="developers", dataframe=dataframe, ...)
}

#' Get details of the developer
#'
#' @inheritParams rawg_request
#' @param id developer id.
#' @examples
#' developers_read("my_app", id=1)
developers_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("developers/", id), dataframe=dataframe, ...)
}

#' Get a list of game achievements
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_achievements_read("my_app", id=1)
games_achievements_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/achievements"), dataframe=dataframe, ...)
}

#' Get a list of DLC's for the game
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_additions_list("my_app", id=1)
games_additions_list <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/additions"), dataframe=dataframe, ...)
}

#' Get a list of creators in the development team
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_development_team_list("my_app", id=1)
games_development_team_list <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/development-team"), dataframe=dataframe, ...)
}

#' Get a list of games that are part of the same series
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_game_series_list("my_app", id=1)
games_game_series_list <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/game-series"), dataframe=dataframe, ...)
}

#' Get a list of games
#'
#' @inheritParams rawg_request
#' @examples
#' games_list("my_app")
games_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="games", dataframe=dataframe, ...)
}

#' Get a list of game trailers
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_movies_read("my_app", id=1)
games_movies_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/movies"), dataframe=dataframe, ...)
}

#' Get a list of parent games for DLC's and editions
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_parent_games_list("my_app", id=1)
games_parent_games_list <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/parent-games"), dataframe=dataframe, ...)
}

#' Get details of the game
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_read("my_app", id=1)
games_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id), dataframe=dataframe, ...)
}

#' Get a list of most recent posts from the game's subreddit
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_reddit_read("my_app", id=1)
games_reddit_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/reddit"), dataframe=dataframe, ...)
}

#' Get screenshots for the game
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_screenshots_list("my_app", id=1)
games_screenshots_list <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/screenshots"), dataframe=dataframe, ...)
}

#' Get The Sitemap Games list
#'
#' @inheritParams rawg_request
#' @examples
#' games_sitemap_read("my_app")
games_sitemap_read <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="games/sitemap", dataframe=dataframe, ...)
}

#' Get links to the stores that sell the game
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_stores_list("my_app", id=1)
games_stores_list <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/stores"), dataframe=dataframe, ...)
}

#' Get a list of visually similar games
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_suggested_read("my_app", id=1)
games_suggested_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/suggested"), dataframe=dataframe, ...)
}

#' Get streams on Twitch associated with the game
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_twitch_read("my_app", id=1)
games_twitch_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/twitch"), dataframe=dataframe, ...)
}

#' Get videos from YouTube associated with the game
#'
#' @inheritParams rawg_request
#' @param id game id.
#' @examples
#' games_youtube_read("my_app", id=1)
games_youtube_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("games/", id, "/youtube"), dataframe=dataframe, ...)
}

#' Get a list of video game genres
#'
#' @inheritParams rawg_request
#' @examples
#' genres_list("my_app")
genres_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="genres", dataframe=dataframe, ...)
}

#' Get details of the genre.
#'
#' @inheritParams rawg_request
#' @param id genre id.
#' @examples
#' genres_read("my_app", id=1)
genres_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("genres/", id), dataframe=dataframe, ...)
}

#' Get a list of video game platforms
#'
#' @inheritParams rawg_request
#' @examples
#' platforms_list("my_app")
platforms_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="platforms", dataframe=dataframe, ...)
}

#' Get a list of parent platforms
#'
#' @inheritParams rawg_request
#' @examples
#' platforms_lists_parents_list("my_app")
platforms_lists_parents_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="platforms/lists/parents", dataframe=dataframe, ...)
}

#' Get details of the platform
#'
#' @inheritParams rawg_request
#' @param id platform id.
#' @examples
#' platforms_read("my_app", id=1)
platforms_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("platforms/", id), dataframe=dataframe, ...)
}

#' Get a list of video game publishers
#'
#' @inheritParams rawg_request
#' @examples
#' publishers_list("my_app")
publishers_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="publishers", dataframe=dataframe, ...)
}

#' Get details of the publisher
#'
#' @inheritParams rawg_request
#' @param id publisher id.
#' @examples
#' publishers_read("my_app", id=1)
publishers_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("publishers/", id), dataframe=dataframe, ...)
}

#' Get a list of video game storefronts
#'
#' @inheritParams rawg_request
#' @examples
#' stores_list("my_app")
stores_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="stores", dataframe=dataframe, ...)
}

#' Get details of the store
#'
#' @inheritParams rawg_request
#' @param id store id.
#' @examples
#' stores_read("my_app", id=1)
stores_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("stores/", id), dataframe=dataframe, ...)
}

#' Get a list of tags
#'
#' @inheritParams rawg_request
#' @examples
#' tags_list("my_app")
tags_list <- function(app_name, dataframe=TRUE, ...){

  rawg_request(app_name, request="tags", dataframe=dataframe, ...)
}

#' Get details of the tag
#'
#' @inheritParams rawg_request
#' @param id tag id.
#' @examples
#' tags_read("my_app", id=1)
tags_read <- function(app_name, id, dataframe=TRUE, ...){

  rawg_request(app_name, request=paste0("tags/", id), dataframe=dataframe, ...)
}


