module Api::V1
  class ProjectsController < ApiController
    before_action :doorkeeper_authorize!

    def index
      render :json => { :projects => current_resource_owner.projects }
    end

    def show #TODO
    end

    def create #TODO ? - scope of the API
    end

    def update #TODO ? - scope of the API
    end

    def destroy #TODO ? - scope of the API
    end
  end
end
