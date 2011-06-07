# vim: fileencoding=utf-8

require 'atom/feed'

desc 'Update movie list.'
task :update_movies do
  begin
    m1 = fetch_movies('start-index=1&max-results=50')
    m2 = fetch_movies('start-index=51&max-results=50')
    File.open('movies.yml', 'w') {|f| f.puts YAML.dump(m1.merge(m2)) }
  rescue => evar
    puts evar.message
  end
end

def fetch_movies(params)
  movies = {}
  feed = Atom::Feed.new("http://gdata.youtube.com/feeds/api/users/realannoyingorange/uploads?orderby=published&#{params}")
  feed.update!
  feed.entries.each {|e| movies[File.basename(URI(e.id).path)] = {'published' => e.published.to_s, 'title' => e.title.to_s} }
  movies
end
