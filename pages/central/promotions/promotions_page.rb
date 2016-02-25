require_relative '../../../config/env.rb'

module Pages
	module Central

		module Promotions
			class PromotionsPage < SitePrism::Page

				set_url '#promotions/'

				
				element :add_Promotion_Button, "#add_new"
				element :name, '#name'
				element :description, '#description'
				element :start_Date, '#start_date'
				element :end_Date, '#end_date'
				element :start_Time, '#start_time'
				element :end_Time, '#end_time'
				element :promotion_Type, '#type'
				element :display_Type, :xpath, "html/body/section/section[2]/section/section[2]/div/div/div/div[1]/form/div[6]/div[2]/select/option[2]"
				element :create_Promotion, '#create_new_button'
				element :go_to_Promotions, '#index'
				element :status, '#status'
				element :inactive_Status, :xpath, "html/body/section/section[2]/section/section[2]/div/div/div/div[1]/form/div[9]/div[2]/select/option[3]"
        element :active_Status, :xpath, "html/body/section/section[2]/section/section[2]/div/div/div/div[1]/form/div[9]/div[2]/select/option[2]"
				element :single_Restaurant_Type_Promotion, :xpath, "html/body/section/section[2]/section/section[2]/div/div/div/div[1]/form/div[6]/div[2]/select/option[3]"
				element :enter_Restaurant, :xpath, "html/body/section/section[2]/section/section[2]/div/div/div/div[1]/form/div[8]/div/textarea"
				element :edit_Promotion, :xpath, "html/body/section/section[2]/section/section[2]/div/div/section/div/div[3]/div/table/tbody/tr[1]/td[9]/p/a"
				element :priority, '#priority'
				element :update_Promotion, :xpath, "html/body/section/section[2]/section/section[2]/div/div/div/div[2]/input"
        element :upload_Image, '#image'

        

 				def Click_Add_Button
 					  add_Promotion_Button.click
 				end

 				def Create_Display_Restaurant_Type_Promotion
 					  name.set("Onkars Promotions Test")
  					description.set("Test Display Restaurant Promotions")
  					start_Date.set("a")
  					start_Time.set("00:00")
  					end_Date.set("a")
  					end_Time.set("23:30")
  					promotion_Type.click
  					display_Type.click
            enter_Restaurant.set("MUM-POWA-0125")
  					status.click
  					inactive_Status.click
  					create_Promotion.click
 					
 				end

 				def Click_Go_to_Promotions
 					  go_to_Promotions.click
 				end

 				def Create_Single_Restaurant_Type_Promotion
 					  add_Promotion_Button.click
  					name.set("Onkars Promotions Test")
  					description.set("Test Display Restaurant Promotions")
  					start_Date.set("a")
  					start_Time.set("00:00")
  					end_Date.set("a")
  					end_Time.set("23:30")
  					promotion_Type.click
  					single_Restaurant_Type_Promotion.click
  					enter_Restaurant.set("MUM-POWA-0125")
  					status.click
  					inactive_Status.click
  					create_Promotion.click
 				end

 				def Create_Promotion_With_Invalid_Time
 					  add_Promotion_Button.click
  					name.set("Onkars Promotions Test")
  					description.set("Test Display Restaurant Promotions")
  					start_Date.set("a")
  					start_Time.set("00:00")
  					end_Date.set("aaaa aaaa")
  					end_Time.set("23:30")
  					promotion_Type.click
  					display_Type.click
            enter_Restaurant.set("MUM-POWA-0125")
  					status.click
  					inactive_Status.click
  					create_Promotion.click
 					
 				end

 				def Alert_Invalid_Value
 					  page.should have_content(text)
 				end

 				def Create_Promotion_Without_Name
 					  add_Promotion_Button.click  					 					
  					description.set("Test Display Restaurant Promotions")
  					start_Date.set("a")
  					start_Time.set("00:00")
  					end_Date.set("a")
  					end_Time.set("23:30")
  					promotion_Type.click
  					display_Type.click
            enter_Restaurant.set("MUM-POWA-0125")
  					status.click
  					inactive_Status.click
  					create_Promotion.click 					
 				end

 				def Edit_Promotion
 					  edit_Promotion.click  					
  					priority.set("100")
  					update_Promotion.click
  					go_to_Promotions.click				
 				end

        def Upload_Image
            add_Promotion_Button.click
            name.set("Onkars Promotions Test")
            description.set("Test Display Restaurant Promotions")
            start_Date.set("a")
            start_Time.set("00:00")
            end_Date.set("a")
            end_Time.set("23:30")
            promotion_Type.click
            display_Type.click
            enter_Restaurant.set("MUM-POWA-0125")
            status.click
            active_Status.click
            attach_file('image', $base_dir + '/data/testdata/promotionbanner.jpg')
            create_Promotion.click
        end
      end
     end
    end
   end  