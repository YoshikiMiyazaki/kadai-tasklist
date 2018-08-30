class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクが追加されました！"
      redirect_to @message
    else
      flash.now[:danger] = "エラーが発生し、タスクの追加ができませんでした。"
      render :new
    end
      
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
     @tasks = Task.find(params[:id])

    if @tasks.update(message_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end
end
