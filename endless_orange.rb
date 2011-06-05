# vim: fileencoding=utf-8

require 'sinatra'

module EndlessOrange
  class Application < Sinatra::Base
    get '/' do
      movies = YAML.load(File.read(File.join(File.dirname(__FILE__), 'movies.yaml')))

      begin
        @video_id = movies.keys.sample
      end until @video_id != params[:vid]

      erb :top
    end
  end
end
