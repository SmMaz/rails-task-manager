class TasksController < ApplicationController
  # Her aksiyon öncesi belirli bir görevi bulmak için (Opsiyonel/Refactor)
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  # 1. Tüm görevleri listele (Read All)
  def index
    @tasks = Task.all
  end

  # 2. Tek bir görevin detayını göster (Read One)
  def show
    # before_action sayesinde @task zaten yüklü
  end

  # 3. Yeni görev formu (Create - Part 1)
  def new
    @task = Task.new
  end

  # 4. Yeni görevi veritabanına kaydet (Create - Part 2)
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 5. Düzenleme formu (Update - Part 1)
  def edit
    # before_action sayesinde @task zaten yüklü
  end

  # 6. Değişiklikleri veritabanına kaydet (Update - Part 2)
  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 7. Görevi sil (Delete)
  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  # Güvenlik için: Sadece izin verilen parametreleri kabul et (Strong Params)
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # Tekrarlanan koddan kaçınmak için (DRY): ID'ye göre görevi bulur
  def set_task
    @task = Task.find(params[:id])
  end
end
