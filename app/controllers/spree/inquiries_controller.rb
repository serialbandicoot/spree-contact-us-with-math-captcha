class Spree::InquiriesController < Spree::BaseController
  helper 'spree/base'
  #resource_controller

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    respond_to do |format|
      if @inquiry.save
        flash[:notice] = t(:on_send_message)
        format.html { redirect_to(@inquiry) }
      else
        format.html {  render :action => "new" }
      end
    end
  end

  #create.flash I18n.t(:on_send_message)

   def new
    @inquiry = Inquiry.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @admin_supplier_type }
    end
  end

  def index
    #redirect_to(new_inquiry_url) unless params[:inquiry]
    @inquiry = Inquiry.all
  end

end
