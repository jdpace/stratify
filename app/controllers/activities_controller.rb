class ActivitiesController < ApplicationController
  def index
    @activities = Activity.desc(:created_at)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.delete
    redirect_to(activities_url)
  end
end