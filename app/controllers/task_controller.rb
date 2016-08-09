class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new(done: false)
  end

  def create
    new_task = Task.new(name: params[:task][:name],done: false)
    new_task.save!
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    stored_task = params[:task]
    @task = Task.find(params[:id])
    (stored_task[:done] == "0")? (stored_task[:done] = false) : (stored_task[:done] = true)
    @task.update(task_params)
    redirect_to tasks_path
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :done)
  end
end
