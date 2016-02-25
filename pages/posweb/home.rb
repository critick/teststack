module Pages
    module PosWeb

          class HomePage < SitePrism::Page
            set_url '/#order_panel'
            set_url_matcher(/\#order_panel$/)

            # individual elements

            element  :neworders_button,'#new'
            element  :preparing_button,'#preparing'
            element  :running_orders,'#running_orders'
            
            element  :mute_button,'#audioUp'
            element  :chefs_link,'#h_chefs'
            element  :items_link,'#h_items'
            element  :menu_planner_link,'#h_menu_planner'
            element  :menu_holder,'.rest_name_hldr'
            element  :history_link,'#h_ordr_hstr'
            element  :raisequery_link,'#h_query'
            element  :logout_link,'#logout'

            #newOrders and Preparing
            element  :no_new_orders,'.no_orders'
            element  :no_new_orders_text,'.text-center.errorText'

            #newOrders

            #Preparing

            #history
            elements :history_per_day,'.col-lg-8.col-md-8.col-sm-8.orders_count_strip',visible: true
            element  :history_no_orders_toast,'.notif_toast'
            element  :history_day,'.col-lg-2.col-md-2.col-sm-2.calenderDay>day',visible: true
            element  :history_per_day_cont,'.col-lg-3.col-md-3.col-sm-3.greyTxt>count'

            #raiseQuery
            element  :submit_query_button,'.SubmitQuery'
            elements :query_categories,'.radio-custom-label',visible: true
            element  :query_text,'.QueryBox>textarea'
            element  :query_category,'.radio-custom-label',visible: true,text: 'App not working'



            #orderCards
            elements :order_card ,'.order-card-lg'


            #view sections
            def view_neworders()
              neworders_button.click
            end

            def view_preparing()
              preparing_button.click
            end

            def view_history()
                hover_on_menu
                history_link.click
            end

            def view_raisequery()
                hover_on_menu
                raisequery_link.click
            end

            def verify_no_orders()
                page.has_css?('.no_orders')
            end

            
            def verify_orders_section(section)
                if has_no_new_orders?
                   $LOG.debug("no #{section} orders present")
                else
                   #wait_untill_order_card_visible
                   has_order_card?
                   $LOG.debug("#{section} orders cards appeared")
                end
            end

            def view_chefs()
              chefs_link.click
            end
            def hover_on_menu
              menu_holder.hover
            end

       end
    end
end
