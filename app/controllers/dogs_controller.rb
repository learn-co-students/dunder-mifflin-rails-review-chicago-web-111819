class DogsController < ApplicationController

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.save
        redirect_to dog_path(@dog)
    end

    def show
        @dog = Dog.find_by(id: params[:id])
    end

    def index
        @dogs = Dog.all
    end

    def edit
        @dog = Dog.find_by(id: params[:id])
    end

    def update
        @dog = Dog.find_by(id: params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end
    
end
