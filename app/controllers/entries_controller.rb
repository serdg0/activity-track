class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @activities = current_user.activities
  end

  def create
    @entry = Entry.create(activity_params)
    @entry.user = current_user

    if @entry.save
      p 'Entry Saved Successfully!'
      redirect_to root_path
    else
      p @entry.errors.messages
    end
  end

  def index
    if user_signed_in?
      @entries = current_user.entries
    else
      @entries = Entry.all
    end
  end

  private

  def activity_params
    params.require(:entry).permit(:hours, :minutes, :date, :activity_id)
  end
end
