class HomeController < ApplicationController
  def index
      date = Date.today.strftime("%Y/%m")
      @invoices = current_user.invoices.where("checkoutday like '%" + date + "%'")
  end
end
