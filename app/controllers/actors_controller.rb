class ActorsController < ApplicationController
    def index
        @actors = Actor.all
    end

    def show
        @actor = Actor.find(params[:id])
    end

    def new
        @actor = Actor.new
    end

    def create
        @actor = Actor.new(actor_params(:name, :years_active))
        if @actor.save
            redirect_to @actor
        else
            render :new
        end
    end

    def edit
        @actor = Actor.find(params[:id])
    end

    def update
        @actor = Actor.find(params[:id])
        @actor.update(actor_params(:name, :years_active))
        if @actor.valid?
            redirect_to @actor
        else
            render :edit
        end
    end

    def destroy
        @actor = Actor.find(params[:id])
        if @actor.destroy
            redirect_to actors_path
        else
            redirect_to back
        end
    end

    private

    def actor_params(*args)
        params.require(:actor).permit(*args)
    end
end
