class EntriesController < ApplicationController
  before_action :require_login
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session[:user_id]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end
  def index
    @entries = Entry.where(user_id: session[:user_id]) # ✅ Only show user's own entries
  end
end
