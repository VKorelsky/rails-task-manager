Rails.application.routes.draw do
  get 'tasks', to: "task#index"

  get 'task/new' , to: "task#new", as: 'new_task'
  post 'tasks' , to: "task#create"

  get 'task/:id' , to: "task#show", as: 'task'

  get 'tasks/:id/edit' , to: "task#edit", as: 'edit_task'
  patch 'task/:id' , to: "task#update"

  delete 'task/:id', to: "task#delete", as: 'delete_task'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

