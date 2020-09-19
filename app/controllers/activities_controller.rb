class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      p "Activity saved successfully!"
      redirect_to root_path
    else
      p @activity.errors.messages
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  private

  def activity_params
    params.require(:activity).permit(:label)
  end
end
