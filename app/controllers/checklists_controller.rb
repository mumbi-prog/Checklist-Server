class ChecklistsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        checklists = Checklist.all
        render json: checklists, include: :checklist_items
    end

    def show
        checklist = Checklist.find_by(date: params[:id])
            if checklist
            categories = checklist.checklist_items.includes(item: :category).group_by { |ci| ci.item.category }
                
            response = {
                id: checklist.id, date: checklist.date, categories: categories.map do |category, checklist_items|
                {
                    id: category.id, name: category.name, items: checklist_items.map do |ci|
                    {
                        id: ci.item.id, name: ci.item.name, status: ci.status, remark: ci.remark
                    }
                    end
                }
                end
            }
        
            render json: response
                else
            render json: { error: 'Checklist not found' }, status: :not_found
            end
    end

    def create
        checklist = Checklist.new(checklist_params)
        if checklist.save
          items = Item.all
          items.each do |item|
            checklist.checklist_items.create(item: item, status: params[:items][item.id.to_s][:status], remark: params[:items][item.id.to_s][:remark])
          end
          render json: checklist, include: :checklist_items, status: :created
        else
          render json: checklist.errors, status: :unprocessable_entity
        end
    end

    private

    def checklist_params
      params.require(:checklist).permit(:date)
    end

end
