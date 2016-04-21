module Pages
    module Web
        class Vote < SitePrism::Page
          set_url '/'
          set_url_matcher(/$/)

          element :titile,'#content-container-center>h3'
          element :choice1,'#a'
          element :choice2,'#b'

          def set_vote(choice)
              case choice
              when "bug"
                   choice1.click
              when "feature"
                  choice2.click
              end
          end

          def get_title
              titile.text
          end
        end
    end
end
