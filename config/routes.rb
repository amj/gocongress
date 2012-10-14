Gocongress::Application.routes.draw do

  # Put the root route at the top so that it is matched quickly
  root :to => "home#index", :via => :get

  # It's time to get strict about format.  If someone requests a .php,
  # that's a 404!  I'd like to add :format => false to all my routes,
  # but it makes my routes file way too ugly, even if I use
  # with_options().  This constraint has the same effect.
  constraints :format => // do

    get "home/access_denied"

    # kaboom is an intentional error to test runtime exception notification
    get "home/kaboom"

    # these routes support multiple years with a year scope
    scope ":year" do

      # :year must be numeric
      constraints :year => /\d+/ do

        get 'edit' => 'years#edit', :as => :edit_year
        put '' => 'years#update', :as => :update_year

        get 'costs' => 'plan_categories#index'
        get 'pricing' => 'home#pricing'

        devise_for :users, :controllers => { :registrations => "registrations" }

        resources :activities, :contacts, :content_categories, :contents,
          :discounts, :activity_categories, :plan_categories,
          :tournaments, :transactions
        resources :attendee_statistics, :only => :index
        resources :plans, :except => [:index]

        resources :attendees, :except => [:show] do
          collection do
            get 'vip'
          end
          member do
            get 'print_summary', :as => 'print_summary_for'
            get 'print_badge', :as => 'print_badge_for'
          end
        end

        resources :users, :except => [:new, :create] do
          member do
            get 'edit_email', :as => 'edit_email_for'
            get 'edit_password', :as => 'edit_password_for'
            get 'invoice'
            get 'ledger'
            get 'pay'
            get 'print_cost_summary', :as => 'print_cost_summary_for'
            get 'choose_attendee'

            # todo: attendees should probably be a nested resource of users
            # see http://guides.rubyonrails.org/routing.html#nested-resources
            get 'attendees/new' => 'attendees#new', :as => 'add_attendee_to'
          end

          resource :terminus, :only => :show
        end

        # The reports_controller is deprecated, except for the index
        # action.  Use the rpt namespace below.
        resources :reports, :only => :index do
          collection do
            get :atn_badges_all, :atn_badges_ind, :atn_reg_sheets,
              :emails, :activities, :invoices,
              :tournaments, :user_invoices
          end
        end

        # The "rpt" namespace has one controller for each report.
        # This replaces the deprecated reports_controller.
        namespace :rpt do
          resource :attendeeless_user_report, :only => :show
          resource :outstanding_balance_report, :only => :show

          # These reports support CSV format
          constraints :format => /(csv)?/ do
            resource :attendee_report, :only => :show
            resource :transaction_report, :only => :show
          end
        end

        # This route provides `year_path`, so it's not defunct,
        # but perhaps it can be combined with the other `root`
        # at the top of the file?
        root :to => 'home#index', :as => :year, :via => :get

      end # end constraint
    end # end scope
  end # end constraint

end
