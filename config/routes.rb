Rails.application.routes.draw do
  # Sadece bu satır tüm CRUD işlemlerini (listele, göster, yeni, sil...) tanımlar
  resources :tasks

  # Ana sayfayı direkt görev listesine yönlendiriyoruz
  root to: "tasks#index"
end
