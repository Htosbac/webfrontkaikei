class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @products = current_user.products.all
    # 並び替え
    @products = current_user.products.order(:productcategory_id, :producttype_id)
  end

  def show
    @product= Product.find(params[:id])
  end

  def new
    @product = Product.new
    @types = Producttype.none # 最初は空を設定
  end

  def edit
    @product= Product.find(params[:id])
    @types = Producttype.where(productcategory_id: @product.productcategory_id)
  end

  def create
    @product = current_user.products.build(product_params)
#    @types = Producttype.all

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: '商品が登録されました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @product= Product.find(params[:id])
    
    if @product.update(product_params)
      redirect_to @product, notice: "内容が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to @product, notice: "削除しました。"
    else
      render :index
    end
#    redirect_to products_path
  end

  # ajax
  def category_select
    # pluckで敢えて配列にしています。
    @types = Producttype.where(productcategory_id: params[:category_id]).pluck(:name, :id)

    # 初期値
    @types.unshift(["選択してください。", ""])
  end

  private

    def set_product
       @product = Product.find_by(user_id: params[:user_id])
    end

    def product_params
      params.require(:product).permit(:productcategory_id, :producttype_id, :name, :price, :user_id)
    end

    def correct_user
        product = Product.find_by(user_id: params[:user_id])
#      if !current_user?(product.user)
#        redirect_to root_path, alert: '許可されていないページです'
#      end
    end

end
