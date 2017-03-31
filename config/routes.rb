Rails.application.routes.draw do
  get('/about', { to: 'about#index' })

  get('/projects', { to: 'projects#index' })
  get('/projects/new', { to: 'projects#new', as: 'new_project' })
  post('/projects', { to: 'projects#create' })
  get('/projects/:id', { to: 'projects#show', as: 'project' })
  get('/projects/:id/edit', { to: 'projects#edit', as: 'edit_project' })
  patch('/projects/:id', { to: 'projects#update' })
  delete('/projects/:id', { to: 'projects#destroy' })

  root 'home#index'
end
