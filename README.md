# Task Management


## Getting Started

Follow these steps to set up the project locally:

- Clone from the repository 

	git clone https://github.com/nirmala-malviya/task_app.git

- Go to inside the project directory run below comman.

	bundle install

- For Database setup

	rails db:create
	rails db:migrate

- Run server locally on port 3001

	rails s -p 3001

Make sure we run rails server on the port other than 3000. To run the application with frontend. As our frontend will default run on port 3000.