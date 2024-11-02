Rails.application.routes.draw do
 # root toはURLの末尾を　/ のみの表示にしたいときに使える
 root to: 'homes#top'
 resources :books
end                                          
