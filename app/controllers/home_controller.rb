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

        if @invoices2.empty?
            maxmonth = 12
        else
            maxmonth = @invoices2.maximum(:checkoutday)[5..6] #当年の最大月
        end
        #当年と同じ月までの売上と件数を表示
        @in4sum = 0 
        @in4count = 0
        @invoices4.each do |in4|
            if in4.checkoutday[5..6] <= maxmonth
                @in4sum = @in4sum + in4.sototal
                @in4count += 1
            end
        end

        #棒グラフデータ
        @data1 = [['売上', @invoices1.sum(:sototal)]]
        @data2 = [['売上', @invoices2.sum(:sototal)]]
        @data3 = [['売上', @invoices3.sum(:sototal)]]
        @data4 = [['売上', @in4sum]]
        @data5 = [['売上', @invoices5.sum(:sototal)]]

        #当年の円グラフデータ
        @plan = 0
        @drink = 0
        @food = 0
        @gift = 0
        @sonota = 0

        @invoices2.each do |in2|
          @billingdetails = current_user.billingdetails.where(invoice_id: in2.id)
          @billingdetails.each do |b|
             case b.productcategory_id
                 when 3 then
                     @plan = @plan + b.productnb
                 when 2 then
                     case b.producttype_id
                         when 1 then
                             @food = @food + b.productnb
                         when 2 then
                             @drink = @drink + b.productnb
                         when 3 then
                             @gift = @gift + b.productnb
                         when 4 then
                             @sonota = @sonota + b.productnb
                     end
             end
           end
        end

        #前年年の円グラフデータ
        @z_plan = 0
        @z_drink = 0
        @z_food = 0
        @z_gift = 0
        @z_sonota = 0

        @invoices4.each do |in4|
          if in4.checkoutday[5..6] <= maxmonth
              @billingdetails = current_user.billingdetails.where(invoice_id: in4.id)
              @billingdetails.each do |b|
                 case b.productcategory_id
                     when 3 then
                         @z_plan = @z_plan + b.productnb
                     when 2 then
                         case b.producttype_id
                             when 1 then
                                 @z_food = @z_food + b.productnb
                             when 2 then
                                 @z_drink = @z_drink + b.productnb
                             when 3 then
                                 @z_gift = @z_gift + b.productnb
                             when 4 then
                                 @z_sonota = @z_sonota + b.productnb
                         end
                  end
               end
           end
        end


      end



  end
end
