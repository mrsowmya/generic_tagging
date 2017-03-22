Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'tags' => 'entities#create'
  get 'tags/:entity_type/:entity_id' => 'entities#show'
  delete 'tags/:entity_type/:entity_id' => 'entities#destroy'
  get 'stats' => 'entities#stats'
  get 'stats/:entity_type/:entity_id' => 'entities#entity_stats'
end
