# To download production data instead of these seeds, run
# rake db:restore_production_dump

channels = [
  { name: 'Angular2', twitter_hashtag: 'angular2' },
  { name: 'command-line', twitter_hashtag: 'commandline' },
  { name: 'devops', twitter_hashtag: 'devops' },
  { name: 'elixir', twitter_hashtag: 'elixir' },
  { name: 'git', twitter_hashtag: 'git' },
  { name: 'html-css', twitter_hashtag: 'htmlcss' },
  { name: 'javascript', twitter_hashtag: 'javascript' },
  { name: 'mobile', twitter_hashtag: 'mobile' },
  { name: 'phoenix', twitter_hashtag: 'phoenixframework' },
  { name: 'rails', twitter_hashtag: 'rails' },
  { name: 'ruby', twitter_hashtag: 'ruby' },
  { name: 'sql', twitter_hashtag: 'sql' },
  { name: 'testing', twitter_hashtag: 'testing' },
  { name: 'vim', twitter_hashtag: 'vim' },
  { name: 'workflow', twitter_hashtag: 'workflow' },
]

print "Creating #{channels.length} channels"
channels.each do |channel|
  Channel.find_or_create_by!(name: channel[:name], twitter_hashtag: channel[:twitter_hashtag])
end
puts " ...done."

print "Creating developers"
5.times do
  username = Phil.name.downcase.delete(' ')
  Developer.create(username: username, email: "#{username}@alex-miller.co")
end
puts " ...done."

print "Creating posts"
40.times do
  channel = Channel.all.sample
  likes = rand(1..20)

  Post.create!(body: Phil.words(100).capitalize,
    channel: channel,
    developer: Developer.all.sample,
    title: Phil.words(2).capitalize,
    likes: likes,
    max_likes: likes,
    created_at: Date.today - rand(30).days,
    published_at: [(Date.today - rand(30).days), nil].sample)
end
puts " ...done."
