Rails.application.routes.draw do
  root to: 'homes#top'
  # 管理者用
# URL /admin/sign_in ...
devise_for :admins, controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}
namespace :admin do
 resources :quizzes,only:[:new,:create]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
