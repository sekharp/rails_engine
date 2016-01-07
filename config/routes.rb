Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoice_items'
          get 'merchant'
        end
      end

      resources :invoices, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'transactions'
          get 'invoice_items'
          get 'items'
          get 'customer'
          get 'merchant'
        end
      end

      resources :customers, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoices'
          get 'transactions'
          get 'favorite_merchant'
        end
      end

      resources :merchants, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
          get 'revenue', to: 'merchants#all_revenue_by_date', defaults: { format: :json }
        end

        member do
          get 'items'
          get 'invoices'
          get 'revenue'
          get 'favorite_customer'
          get 'customers_with_pending_invoices'
        end
      end

      resources :transactions, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoice'
        end
      end

      resources :invoice_items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get 'invoice'
          get 'item'
        end
      end
    end
  end
end
