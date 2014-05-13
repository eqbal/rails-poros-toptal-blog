class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entry   = Entry.new
    @entries = current_user.entries.order(created_at: :desc)
  end

  def create
    entry_service = CreateEntry.new(current_user, entry_params)

    if entry_service.call
      flash[:notice] = 'Entry was successfully created.'
    else
      flash[:error] = entry_service.entry_form.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end

  def destroy
    @entry = Entry.find(params[:id])

    if @entry.destroy!
      flash[:notice] = "Entry was destroyed."
    else
      flash[:error] = @entry.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:user_id, :distance, :time_period, :date_time, :created_at, :updated_at, :distance_type, :status_weather, :status_landform)
  end

end