class ChecklistItemsController < ApplicationController

    def index
        checklists = Checklist.all
        render json: checklists, include: :checklist_items
    end

    def show
        checklist = Checklist.find(params[:id])
        render json: checklist, include: :checklist_items
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
