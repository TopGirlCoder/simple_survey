json.extract! vote, :id, :value, :survey_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
