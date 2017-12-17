json.data do
  json.array! @meetups do |meetup|
    json.title meetup.title
    json.meetup_time  meetup.meetup_time
  end
end