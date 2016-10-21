class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :set_task
  before_filter :authenticate_user!

  respond_to :html

  def index
    @todos = Todo.all
    respond_with(@todos)
  end

  def show
    respond_with(@todo)
  end

  def new
    @todo = Todo.new
    respond_with(@todo)
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    respond_with(@task)
  end

  def update
    @todo.update(todo_params)
    respond_with(@task)
  end

  def destroy
    @todo.destroy
    respond_with(@todo)
  end

  def my_todo_list
    @my_todos = current_user.todos
  end

  private
    def set_task
      @task = Task.find_by_id(params[:task_id])
    end
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:name, :description, :task_id, :user_id, :ends_at, :status)
    end
end
