json.extract! game, :id, :puzzle_id, :status, :created_at, :updated_at
json.url game_url(game, format: :json)
