class CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: categories, include: :items
    end
end
