class HomeController < ApplicationController
  def index
      date = Date.today
      #当月、当年
      yymm = date.strftime("%Y/%m")
      yy = date.strftime("%Y")
      #前月、前年
      zenyymm = date.prev_month.strftime("%Y/%m")
      zenyy = date.prev_year.strftime("%Y")
      # 来月
      raiyymm = date.next_month.strftime("%Y/%m")
      
      if user_signed_in?
        @invoices1 = current_user.invoices.where("checkoutday like '%" + yymm + "%'")
        @invoices2 = current_user.invoices.where("checkoutday like '%" + yy + "%'")
        @invoices3 = current_user.invoices.where("checkoutday like '%" + zenyymm + "%'")
        @invoices4 = current_user.invoices.where("checkoutday like '%" + zenyy + "%'")
        @invoices5 = current_user.invoices.where("checkoutday like '%" + raiyymm + "%'")
      end
      
  end
end
