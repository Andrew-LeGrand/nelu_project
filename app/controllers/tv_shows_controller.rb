class TvShowsController < ApplicationController
    before_action :set_tv_show, only:[:show, :edit, :update, :destroy]

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
        @show = TvShow.new(tv_show_params)

        if @show.save
            flash[:notice] = "TV Show was successfully added to your Watch List!"
            redirect_to @show
        else
            flash[:notice] = "There was an error when processing this TV Show..."
            render :new, status: :unprocessable_entity
        end
    end

    # GET - To edit a TV Show
    def edit
    end

    # POST - To execute edits to a TV Show
    def update
        if @show.update(tv_show_params)
            redirect_to tv_shows_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # GET - show a specific TV Show
    def show 
    end

    # DELETE - delete the TV Show that is being viewed
    def destroy
        @show.delete
        redirect_to tv_shows_path
    end

    private

    # Permits attributes of TV Show
    def tv_show_params
        params.require(:tv_show).permit(:name, :description, :image_path, :seasons, genre_ids: [])
    end

    # Grabs ahold of the TV Show we want to view
    def set_tv_show
        @show = TvShow.find(params[:id])
    end
end
