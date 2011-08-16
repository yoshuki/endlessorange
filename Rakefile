# vim: fileencoding=utf-8

require 'atom/feed'

desc 'Update movie list.'
task :update_movies do
  begin
    m1 = fetch_movies('start-index=1&max-results=50')
    m2 = fetch_movies('start-index=51&max-results=50')
    File.open(File.join('config', 'movies.yml'), 'w') {|f| f.puts YAML.dump(m1.merge(m2)) }
  rescue => evar
    puts evar.message
  end
end

def fetch_movies(params)
  movies = {}
  feed = Atom::Feed.new("http://gdata.youtube.com/feeds/api/users/realannoyingorange/uploads?orderby=published&#{params}")
  feed.update!
  feed.entries.each do |entry|
    thumbnail = entry.extensions.detect {|ext| ext.expanded_name == 'media:group' }.elements['media:thumbnail']
    movies[File.basename(URI(entry.id).path)] = {'published' => entry.published.to_s,
                                                 'title'     => entry.title.to_s,
                                                 'thumbnail' => {'url'    => thumbnail.attributes['url'].to_s,
                                                                 'height' => thumbnail.attributes['height'].to_s,
                                                                 'width'  => thumbnail.attributes['width'].to_s}}
  end
  movies
end
