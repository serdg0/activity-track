class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create(entry_params)
    @entry.user = current_user
    @entry.activity_id = params[:activity_id].to_i
    if @entry.save
      flash[:notice] = 'Entry Saved Successfully!'
    else
      flash[:alert] = @entry.errors.full_messages.first
    end
    redirect_to root_path
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
