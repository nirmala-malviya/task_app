class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
    tasks = Task.all
    render json: tasks, status: 200
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: 201
    else
      render json: {message: "Unable to create the task."}
    end

  end

  def update
    if @task.update(task_params)
      render json: @task, status: 200
    else
      render json: @task.errors, status: 422
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
    unless @task
      render json: { error: "Task not found." }, status: 404
    end
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
