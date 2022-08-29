class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html{ redirect_to tasks_url, notice: "That was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      respond_to do |format|
        if @task.update(task_params)
          format.html{ redirect_to tasks_url, notice: "That was successfully updated" }
        else
          format.html { render :new, notice:"Just do it again!!!"}
        end
      end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice:"post was successfully deleted"
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])
    render json:{message: "Success"}
  end
  private

  def task_params
    params.require(:task).permit(:description)
  end
end



# import {Controller} from "@hotwire/stimulus"

# export default class extends Controller{
#   connect() {
#     comsole.log(this.element)
#   }

#   toggle(e){
#     const id = e.target.dataset.id
#     const csrfToken = document.querySelector("[name='csrf-token']").content

#     fetch('/tasks/${id}/toggle',{
#       method: 'POST'.
#       mode: 'cors',
#       cache: 'no-cache',
#       credentials: 'same-origin',
#       headers: {
#         'Content-Type': 'application/json',
#         'X-CSRF-Token': csrfToken
#       },
#       body: JSON.stringify({ completed: e.target.checked})
#     })
#       .then(response => response.json())
#       .then(data => {
#         alert(data.message)
#     })
#   }
# }