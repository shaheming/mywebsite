class MeetupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_meetup, :only =>[:destroy,:edit,:create,:update]
  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.includes(:posts).find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      redirect_to meetup_path(@meetup)
    else
      render :new
    end
  end

  def edit
  end
  def update
    
    if @meetup.update(meetup_params)
      redirect_to meetup_path(@meetup)
    else
      render :edit
    end
  end
  def destroy
    if @meetup.destroy
      redirect_to meetups_path
    end
  end
  private

  def find_meetup
    @meetup = Meetup.find_by_id(params[:id])
  end
  def meetup_params
    params.require(:meetup).permit(:title,:meetup_time,:description)
  end

end
