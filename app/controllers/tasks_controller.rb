class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    task_params = params.require(:task).permit(:title, :body, :due_date)
    @task = Task.new(task_params)
    @task.project = @project

    if @task.save
      redirect_to project_path(@project), notice: 'Task created!'
    else
      render '/projects/show'
    end
  end

  def update
    task = Task.find(params[:id])
    if task.done
      task.update({ done: false })
      redirect_to project_path(task.project), notice: 'Task marked not done'
    else
      task.update({ done: true })
      redirect_to project_path(task.project), notice: 'Task marked done'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to project_path(task.project), notice: 'Task Deleted'
  end
end
