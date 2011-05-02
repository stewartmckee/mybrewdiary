class BrewTypesController < ApplicationController
  # GET /brew_types
  # GET /brew_types.xml
  def index
    @brew_types = BrewType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brew_types }
    end
  end

  # GET /brew_types/1
  # GET /brew_types/1.xml
  def show
    @brew_type = BrewType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brew_type }
    end
  end

  # GET /brew_types/new
  # GET /brew_types/new.xml
  def new
    @brew_type = BrewType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brew_type }
    end
  end

  # GET /brew_types/1/edit
  def edit
    @brew_type = BrewType.find(params[:id])
  end

  # POST /brew_types
  # POST /brew_types.xml
  def create
    @brew_type = BrewType.new(params[:brew_type])

    respond_to do |format|
      if @brew_type.save
        format.html { redirect_to(@brew_type, :notice => 'Brew type was successfully created.') }
        format.xml  { render :xml => @brew_type, :status => :created, :location => @brew_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brew_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brew_types/1
  # PUT /brew_types/1.xml
  def update
    @brew_type = BrewType.find(params[:id])

    respond_to do |format|
      if @brew_type.update_attributes(params[:brew_type])
        format.html { redirect_to(@brew_type, :notice => 'Brew type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brew_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brew_types/1
  # DELETE /brew_types/1.xml
  def destroy
    @brew_type = BrewType.find(params[:id])
    @brew_type.destroy

    respond_to do |format|
      format.html { redirect_to(brew_types_url) }
      format.xml  { head :ok }
    end
  end
end
