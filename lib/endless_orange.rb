# vim: fileencoding=utf-8

require 'sinatra'

module EndlessOrange
  class Application < Sinatra::Base
    configure do
      set :root, File.expand_path('..', File.dirname(__FILE__))
      @@movies = YAML.load(File.read(File.join(settings.root, 'config', 'movies.yml'))).freeze
    end

    get '/' do
      @movies = @@movies
      erb :top
    end

    get '/hey' do
      if @@movies.keys.include?(params[:next])
        @video_id = params[:next]
      else
        begin
          @video_id = @@movies.keys.sample
        end until @video_id != params[:last]
      end

      @video_title = @@movies[@video_id]['title']

      erb :hey
    end
  end
end
