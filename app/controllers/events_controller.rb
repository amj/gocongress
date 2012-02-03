class EventsController < ApplicationController

  load_and_authorize_resource

  # GET /activities/1
  def show
  end

  # GET /activities/new
  def new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  def create
    @activity.year = @year
    if @activity.save
      redirect_to @activity, :notice => "#{Activity.model_name.human} created"
    else
      render :action => "new"
    end
  end

  # PUT /activities/1
  def update
    if @activity.update_attributes(params[:activity])
      redirect_to @activity, :notice => "#{Activity.model_name.human} updated"
    else
      render :action => "edit"
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    redirect_to activities_url
  end

  def event_category_options
    EventCategory.yr(@year).all.map {|c| [ c.name, c.id ] }
  end
  helper_method :event_category_options

end
