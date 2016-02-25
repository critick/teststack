module Pages
    module PosWeb

          class HistoryPage < SitePrism::Page
            set_url '/#order_history'
            set_url_matcher(/\#order_history$/)

            #history
            elements :history_per_day,'.col-lg-10.col-md-10.col-sm-10.orders_count_strip',visible: true
            element  :history_no_orders_toast,'.history_toast'
            element  :history_day,'.col-lg-2.col-md-2.col-sm-2.calenderDay>day',visible: true
            element  :history_per_day_cont,'.col-lg-3.col-md-3.col-sm-3.greyTxt>count'

            #orderCards
            elements :order_card ,'.order-card'


            def get_history_days_count()
                wait_until_history_per_day_visible
                return history_per_day.size
            end

            def view_history_summary(day)
                find('.col-lg-2.col-md-2.col-sm-2.calenderDay>day',text:"#{day}").click
            end

            def verify_history_summary
                if has_history_no_orders_toast?
                   $LOG.debug("no orders toast appeared")
                else
                   #wait_untill_order_card_visible
                   has_order_card?
                   $LOG.debug("past orders cards appeared")
                end
            end

       end
    end
end
