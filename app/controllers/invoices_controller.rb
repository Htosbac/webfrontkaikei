class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @q = current_user.invoices.search(params[:q])
    @nengetu = params[:q]
    @invoices = @q.result(distinct: true).order(:checkoutday)
  end


  def show
      @billingdetails = Billingdetail.where(invoice_id: params[:id]).where(user_id: params[:user_id])
      @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
    @invoice.billingdetails.build
    @rooms = current_user.rooms.all
    @types = Producttype.none # 最初は空を設定
    @products = Product.none # 最初は空を設定
    @price = 0
  end


  def edit
    @rooms = current_user.rooms.all
    @invoice = Invoice.find(params[:id])
    @billingdetails = Billingdetail.where(invoice_id: params[:id]).where(user_id: params[:user_id])
    
#    @billingdetails.each do |b|
#        @types = Producttype.where(productcategory_id: b.productcategory_id)
#    end
    @types = Producttype.all
    @products = Product.all
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)
    @rooms = current_user.rooms.all
    @types = Producttype.all
    @products = Product.all

    respond_to do |format|
      if @invoice.save 
        format.html { redirect_to @invoice, notice: '領収書データを登録しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @rooms = current_user.rooms.all

    #対応するBillingdetailテーブルにデータ削除
    Billingdetail.where(invoice_id: params[:id]).where(user_id: params[:user_id]).destroy_all
    @invoice = Invoice.find(params[:id])

    if @invoice.update(invoice_params) 
      redirect_to @invoice, notice: "内容が更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    if @invoice.destroy
      redirect_to @invoice, notice: "削除しました。"
    else
      render :index
    end
#    respond_to invoices_path
  end

  # ajax
  def category_select
    # pluckで敢えて配列にしています。
    @types = Producttype.where(productcategory_id: params[:category_id]).pluck(:name, :id)
    @idx = params[:idx]
    # 初期値
    @types.unshift(["選択してください", ""])
  end
  def type_select
    # pluckで敢えて配列にしています。
    @products = Product.where(productcategory_id: params[:category_id]).where(producttype_id: params[:type_id]).pluck(:name, :id)
    @idx = params[:idx]
    # 初期値
    @products.unshift(["選択してください", ""])
  end
  def name_select
    # pluckで敢えて配列にしています。
    @price = current_user.products.where(id: params[:product_id]).pluck(:price)
    @idx = params[:idx]
  end

  private

    def set_invoice
      @invoice = Invoice.find_by(user_id: params[:user_id])
    end

    def invoice_params
      params.require(:invoice).permit(:customer, :checkoutday, :stays, :adults, :childs, :room_id, :roomfee, :sototal, :user_id, billingdetails_attributes: [:user_id, :invoice_id, :product_id, :productcategory_id, :producttype_id, :productname, :productprice, :productnb, :total, :productdate, :_destroy])
    end

    def correct_user
       invoice = Invoice.where(user_id: params[:user_id])
       room = Room.where(user_id: params[:user_id])
       billingdetail = Billingdetail.where(user_id: params[:user_id])
#      if !current_user?(product.user)
#        redirect_to root_path, alert: '許可されていないページです'
#      endjq
    end


end
