class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create(entry_params)
    @entry.user = current_user
    @entry.activity_id = params[:activity_id]
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

  def entry_params
    params.require(:entry).permit(:from_time, :to_time, :date)
  end
end
