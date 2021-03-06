class BrewingsController < ApplicationController
  # GET /brewings
  # GET /brewings.xml

  before_filter :authenticate_user!  
  
  def index
    @brewings = Brewing.all
    
    @current_brewings = Brewing.current.for(current_user)
    @past_brewings = Brewing.past.for(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brewings }
    end
  end

  # GET /brewings/1
  # GET /brewings/1.xml
  def show
    @brewing = Brewing.find(params[:id])

    if @brewing.ready_on < DateTime.now
      @brewing.update_attributes(:state => "READY")
    end    
    
    redirect_to "/" unless @brewing.user.id == current_user.id or current_user.admin?

    @t_graph = HighChart.new('temperature') do |f|
      f.options[:chart][:defaultSeriesType] = "line"
      f.options[:chart][:backgroundColor] = "#1d1d1d"
      f.options[:title][:text] = "Temperature Readings"
      f.options[:legend][:enabled] = false
      f.series(:name=>'Temperature', :data=>@brewing.readings.map{|r|[r.taken_on.to_i*1000, r.temperature]})
      f.y_axis(:title => {:text => "Temperature C"})
      f.x_axis(:type => "datetime", :title => {:text => "Date Taken On"}, :dateTimeLabelFormats => {:month => '%e %b', :year => '%b'})
      #f.options[:x_axis][:categories] = @brewing.readings.map{|r| friendly_date(r.taken_on)}
  
    end
    @sg_graph = HighChart.new('specific_gravity') do |f|
      f.options[:chart][:defaultSeriesType] = "line"
      f.options[:chart][:backgroundColor] = "#1d1d1d"
      f.options[:title][:text] = "Specific Gravity Readings"
      f.options[:legend][:enabled] = false
      f.y_axis(:title => {:text => "Specific Gravity"})
      f.x_axis(:type => "datetime", :title => {:text => "Date Taken On"}, :dateTimeLabelFormats => {:month => '%e %b', :year => '%b'})
      f.series(:name=>'Specific Gravity', :data=> @brewing.readings.map{|r| [r.taken_on.to_i*1000, r.specific_gravity]} )
      #f.options[:x_axis][:categories] = @brewing.readings.map{|r| friendly_date(r.taken_on)}
      
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brewing }
    end
  end

  # GET /brewings/new
  # GET /brewings/new.xml
  def new
    @brewing = Brewing.new
    @brewing.user_id = current_user.id
    @brewing.bottled_on = Date.today + 7.days
    @brewing.ready_on = Date.today + 5.weeks

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brewing }
    end
  end

  # GET /brewings/1/edit
  def edit
    @brewing = Brewing.find(params[:id])
  end

  # POST /brewings
  # POST /brewings.xml
  def create
    @brewing = Brewing.new(params[:brewing])
    @brewing.user = current_user
    @brewing.state = "PRIMARY"

    respond_to do |format|
      if @brewing.save
        format.html { redirect_to(@brewing, :notice => 'Brewing was successfully created.') }
        format.xml  { render :xml => @brewing, :status => :created, :location => @brewing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brewing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brewings/1
  # PUT /brewings/1.xml
  def update
    @brewing = Brewing.find(params[:id])

    respond_to do |format|
      if @brewing.update_attributes(params[:brewing])
        format.html { redirect_to(@brewing, :notice => 'Brewing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brewing.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def set_bottled
    @brewing = Brewing.find(params[:brewing_id])
    @brewing.state = "SECONDARY"
    @brewing.bottled_on = DateTime.now
    @brewing.ready_on = DateTime.now + 4.weeks
    @brewing.save
    
    redirect_to @brewing
  end

  def set_ready
    @brewing = Brewing.find(params[:brewing_id])
    @brewing.state = "READY"
    @brewing.ready_on = DateTime.now
    @brewing.save
    
    redirect_to @brewing
  end
  
  def rate
    @brewing = Brewing.find(params[:id])
    @brewing.rate(params[:stars], current_user, params[:dimension])
    average = @brewing.rate_average(true, params[:dimension])
    width = (average / @brewing.class.max_stars.to_f) * 100
    render :json => {:id => @brewing.wrapper_dom_id(params), :average => average, :width => width}
  end


  # DELETE /brewings/1
  # DELETE /brewings/1.xml
  def destroy
    @brewing = Brewing.find(params[:id])
    @brewing.destroy

    respond_to do |format|
      format.html { redirect_to(brewings_url) }
      format.xml  { head :ok }
    end
  end
end
