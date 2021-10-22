Rails.application.routes.draw do
  # ROUTE HALAMAN INDEX
  root to: 'user#index'

  # ROUTE FUNGSI LOGIN
  get '/index', to: 'user#index', as: 'user_index'
  post '/auth', to: 'user#auth', as: 'user_auth'
  get '/register', to: 'user#register', as: 'user_register'
  post '/register/kirim', to: 'user#kirim', as: 'user_kirim'
  delete '/logout/:id', to: 'user#logout', as: 'user_logout'

  # ROUTE FUNGSI ADMIN
  # Untuk Fungsi Get harus ada Views nya jadi silahkan tambahkan file di views
  get '/admin/index', to: 'crud#index', as: 'crud_index'
  get '/admin/add', to: 'crud#add', as: 'crud_add'
  post '/admin/add/kirim', to: 'crud#kirim', as: 'crud_kirim'
  get '/admin/:id/edit', to: 'crud#edit', as: 'crud_edit'
  patch '/admin/:id/edit/update', to: 'crud#update', as: 'crud_update'
  delete '/admin/:id/delete', to: 'crud#delete', as: 'crud_delete'
end
