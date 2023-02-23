class TvShowsController < ApplicationController
    # GET - show all TV Shows
    def index
        @shows = TvShow.all
    end

    # GET - request page with form to create a TV Show
    def new
        @show = TvShow.new
    end

    #POST - add newly create TV Show to the Watch List
    def create
        @show = TvShow.new
        debugger
    end
end
