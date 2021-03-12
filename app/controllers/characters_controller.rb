class CharactersController < ApplicationController
    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end

    def new
        @character = Character.new
        @shows = []
        @actors = []
        Show.all.each do |show|
            @shows << show.title
        end
        Actor.all.each do |actor|
            @actors << actor.name
        end
    end

    def create
        actor = Actor.find_by(name: params[:character][:actor_id])
        show = Show.find_by(title: params[:character][:show_id])
        @character = Character.new(character_params(:name, :bio))
        @character.show_id = show.id
        @character.actor_id = actor.id
        if @character.save
            redirect_to @character
        else
            render :new
        end
    end

    def edit
        @character = Character.find(params[:id])
        @shows = []
        @actors = []
        Show.all.each do |show|
            @shows << show.title
        end
        Actor.all.each do |actor|
            @actors << actor.name
        end
    end

    def update
        @character = Character.find(params[:id])
        @character.update(character_params(:name, :bio, :actor_id, :show_id))
        if @character.valid?
            redirect_to @character
        else
            render :edit
        end
    end

    def destroy
        @character = Character.find(params[:id])
        if @character.destroy
            redirect_to characters_path
        else
            redirect_to back
        end
    end

    private

    def character_params(*args)
        params.require(:character).permit(*args)
    end
end
