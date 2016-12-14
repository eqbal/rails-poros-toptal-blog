class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entry   = Entry.new
    @entries = current_user.entries.order(created_at: :desc)
  end

  def create
    begin
      CreateEntry.new(current_user, entry_params).call
      flash[:notice] = 'Entry was successfully created.'
    rescue Exception => e
      flash[:error] = e.message
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
