class ChecklistItemsController < ApplicationController

    def index
        checklists = Checklist.all
        render json: checklists, include: :checklist_items
    end
    
end
