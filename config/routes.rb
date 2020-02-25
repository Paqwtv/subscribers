Rails.application.routes.draw do
  NAMESPACES = %w[admin mobile web].freeze

  namespace 'v1' do
    NAMESPACES.each do |namespace|
      namespace namespace do
        resources :programs
        resources :users
      end
    end
  end
end
