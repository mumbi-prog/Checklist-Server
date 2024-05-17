class ChecklistItemsController < ApplicationController

    def index
        checklists = Checklist.all
        render json: checklists, include: :checklist_items
    end

    def show
        checklist = Checklist.find(params[:id])
        render json: checklist, include: :checklist_items
    end

    private

    def checklist_params
      params.require(:checklist).permit(:date)
    end

end
