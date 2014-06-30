class DocumentOrdersController < ApplicationController
  before_action :check_owner
  before_action :check_active, except: [:show]

  def new
    @templates =
      DocumentTemplate.all.select([:id, :name]).collect{|t| [t.name, t.id]}
  end

  def create
    order =
      Client.find(params[:client_id]).document_orders.create(order_params)
    redirect_to document_order_path(order)
  end

  def show
    
  end
  
  def doc
    send_file @order.export, type: 'application/pdf' 
  end
  
  def pass
    send_file @order.client.foreign_passport_data.create_passport_18_up("#{Rails.root}/public/generated_documents/Passport#{@order.id}.docx"), type: 'application/docx' 
  end
  
  def passch
    send_file @order.client.foreign_passport_data.create_passport_18_down("#{Rails.root}/public/generated_documents/ChildPassport#{@order.id}.docx"), type: 'application/docx' 
  end  
  
  def visacontr
    send_file @order.client.gen_visa_contract("#{Rails.root}/lib/docx_templates/visa_contract.docx", "#{Rails.root}/public/generated_documents/DocumentOrderContract#{@order.id}.docx"), type: 'application/docx' 
  end
  
  def passportcontr
    send_file @order.client.gen_passport_contract("#{Rails.root}/lib/docx_templates/passport_contract.docx", "#{Rails.root}/public/generated_documents/DocumentOrderContract#{@order.id}.docx"), type: 'application/docx' 
  end

  def update
    @order.update(order_params)
    redirect_to document_order_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to client_path(@client)
  end

  private
  def check_owner
    @client = Client.find_by(id: params[:client_id])
    @order = DocumentOrder.find_by(id: params[:id]) ||
      @client.document_orders.build
    @client = @order.client if @client.nil?
    @manager = @client.manager
    @company = @manager.company
    @show_breadcrumb = true
    unless @user.role == "admin" ||
      (@user.role == "company" && @user.owner.id == @company.id) ||
      (@user.role == "manager" && @user.owner.id == @manager.id)
      redirect_to root_path
    end
  end

  def order_params
    params[:document_order].permit(:comments, :document_template_id, :status)
  end

end
