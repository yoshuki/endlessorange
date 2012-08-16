# vim: fileencoding=utf-8

require 'sinatra'

module EndlessOrange
  class Application < Sinatra::Base
    configure do
      set :root, File.expand_path('..', File.dirname(__FILE__))
      movies_yml = File.join(settings.root, 'tmp', 'movies.yml')
      movies_yml = File.join(settings.root, 'config', 'movies.yml') unless File.exist?(movies_yml)
      @@movies = YAML.load_file(movies_yml).freeze
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

    helpers do
      include Rack::Utils
      alias_method :h, :escape_html
      alias_method :u, :escape
    end
  end
end
