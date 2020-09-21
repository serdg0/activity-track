class ActivitiesController < ApplicationController
  def index
    @activities = current_user.activities
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      flash[:notice] = "#{@activity.label} saved successfully!"
    else
      flash[:alert] = @activity.errors.full_messages.first
    end
    redirect_to root_path
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
