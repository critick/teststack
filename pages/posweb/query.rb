module Pages
    module PosWeb

          class QueryPage < SitePrism::Page
            set_url '/#query'
            set_url_matcher(/\#query$/)

            #raiseQuery
            element  :submit_query_button,'.SubmitQuery'
            elements :query_categories,'.radio-custom-label',visible: true
            element  :query_text,'.QueryBox>textarea'
            element  :query_category,'.radio-custom-label',visible: true,text: 'App not working'

            def get_query_categories_count()
                wait_until_query_categories_visible
                return query_categories.size
            end
            
            def verify_raise_query(query)
                query_categories
                if Capybara.current_driver == :poltergeist
                   find('.radio-custom-label', text:"#{query}").click
                else
                   choose(query)
                end
                has_query_text?
                has_submit_query_button?
            end

       end
    end
end
