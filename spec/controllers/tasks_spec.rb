# spec/requests/tasks_spec.rb
require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /api/v1/tasks" do
    it "returns all tasks" do
      FactoryBot.create_list(:task, 2)
      get "/api/v1/tasks"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "POST /api/v1/tasks" do
    it "creates a new task" do
      task_params = { task: { title: "Todo Task", description: "Test Description", status: "To Do" } }
      post "/api/v1/tasks", params: task_params
      expect(response).to have_http_status(201)
    end

    it "if title is missing" do
      task_params = { task: { description: "No Title Task", status: "To Do" } }
      post "/api/v1/tasks", params: task_params
      expect(JSON.parse(response.body)['message']).to(eq('Unable to create the task.'))
    end
  end

  describe "PATCH /api/v1/tasks/:id" do
    it "task status update" do
      task = FactoryBot.create(:task)
      task_updated_params = { task: { status: "Done" } }
      patch "/api/v1/tasks/#{task.id}", params: task_updated_params
      expect(response).to have_http_status(200)
    end

    it "if task id not present" do
      task_updated_params = { task: { status: "Done" } }
      patch "/api/v1/tasks/19", params: task_updated_params
      expect(response).to have_http_status(404)
    end
  end

  describe "DELETE /api/v1/tasks/:id" do
    it "deletes a task" do
      task = FactoryBot.create(:task)
      delete "/api/v1/tasks/#{task.id}"
      expect(response).to have_http_status(204)
      expect(Task.find_by(id: task.id)).to be_nil
    end
  end
end
