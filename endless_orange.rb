# vim: fileencoding=utf-8

require 'sinatra'

module EndlessOrange
  class Application < Sinatra::Base
    configure do
      set :root, File.dirname(__FILE__)
    end

    get '/' do
      erb :top
    end

    get '/hey' do
      movies = YAML.load(File.read(File.join(File.dirname(__FILE__), 'movies.yml')))

      if movies.keys.include?(params[:next])
        @video_id = params[:next]
      else
        begin
          @video_id = movies.keys.sample
        end until @video_id != params[:last]
      end

      @video_title = movies[@video_id]['title']

      erb :hey
    end
  end
end
