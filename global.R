library(spotifyr)
library(dotenv)

# Load environment variables
dotenv::load_dot_env(".env.R")

# Authenticate with Spotify
Sys.setenv(SPOTIFY_CLIENT_ID = Sys.getenv("SPOTIFY_CLIENT_ID"))
Sys.setenv(SPOTIFY_CLIENT_SECRET = Sys.getenv("SPOTIFY_CLIENT_SECRET"))

# Generate an access token
access_token <- get_spotify_access_token()

# Get top artists function
get_top_artists <- function() {
  # Fetch top artists using Spotify API
  top_artists <- get_top_artists_or_tracks(type = "artists", limit = 5)
  
  # Extract artist names
  top_artist_names <- top_artists$name
  return(top_artist_names)
}

