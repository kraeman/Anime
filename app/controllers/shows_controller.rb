class ShowsController < ApplicationController
    def index
        @shows = Show.all
    end

    def show
        @show = Show.find(params[:id])
    end

    def new
        @show = Show.new
    end

    def create
        @show = Show.new(show_params(:title, :year_aired))
        if @show.save
            redirect_to @show
        else
            render :new
        end
    end

    def edit
        @show = Show.find(params[:id])
    end

    def update
        @show = Show.find(params[:id])
        @show.update(show_params(:title, :year_aired))
        if @show.valid?
            redirect_to @show
        else
            render :edit
        end
    end

    def destroy
        @show = Show.find(params[:id])
        if @show.destroy
            redirect_to shows_path
        else
            redirect_to back
        end
    end

    private

    def show_params(*args)
        params.require(:show).permit(*args)
    end
end
