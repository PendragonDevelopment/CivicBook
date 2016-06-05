json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :survey_type, :survey_url
  json.url feedback_url(feedback, format: :json)
end
