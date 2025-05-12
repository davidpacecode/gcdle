json.extract! puzzle, :id, :word_id, :puzzle_date, :puzzle_number, :created_at, :updated_at
json.url puzzle_url(puzzle, format: :json)
