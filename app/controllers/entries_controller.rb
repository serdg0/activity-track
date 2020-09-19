class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @activities = current_user.activities
  end

  def create
    @entry = Entry.create(activity_params)
    @entry.user = current_user
    p params
    if @entry.save
      p 'Entry Saved Successfully!'
      redirect_to root_path
    else
      p @entry.errors.messages
    end
  end

  def index
    @entries = current_user.entries
  end

  def destroy
    @activity = Entry.find(params[:id])
    @activity.destroy
    redirect_to root_path
  end

  private

  def activity_params
    params.require(:entry).permit(:from_time, :to_time, :date, :activity_id)
  end
end
