# vim: fileencoding=utf-8

require 'sinatra'

module EndlessOrange
  class Application < Sinatra::Base
    get '/' do
      erb :top
    end

    get '/hey' do
      movies = YAML.load(File.read(File.join(File.dirname(__FILE__), 'movies.yml')))

      begin
        @video_id = movies.keys.sample
        @video_title = movies[@video_id]['title']
      end until @video_id != params[:vid]

      erb :hey
    end
  end
end
