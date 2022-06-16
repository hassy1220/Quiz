Rails.application.routes.draw do
  root to: 'homes#top'
  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}
namespace :admin do
 resources :quizzes,only:[:new,:create] do
   resources :questions,only:[:new,:create] do
     resources :choices,only:[:new,:create,:edit,:update,:show]
     resources :vest_answers,only:[:create,:edit,:update]
   end
 end
end

devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :public do
 resources :customers,only:[:show,:index]
 resources :quizzes,only:[:index,:show,:create] do
  resources :questions,only:[:show,:create] do
    resources :choices,only:[:show]
  end
  get "next/:id",to: 'questions#step',as:"nextstep"
  resources :answers,only:[:new,:create]
  get "result",to: 'answers#result',as:"result"
 end
 resources :requests,only:[:new,:create]
end

devise_scope :customer do
  post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
