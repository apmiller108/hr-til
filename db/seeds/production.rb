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

channels.each do |channel|
  Channel.find_or_create_by!(name: channel[:name], twitter_hashtag: channel[:twitter_hashtag])
end
