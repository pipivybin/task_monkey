Welcome to task_monkey gem!

<!-- Three models
- User
    > username
    > password_digest
- Task
    > name
    > descrption
    > create_time format wrong
    > Deadline format wrong
- Project
    > name -->


Views
<!-- - User:
    > index
        > welcome; log in or sign up
    > login
    > signup -->
- Task:
    > new: create new task; create or assign to a project
    > edit: assign to projects
- Project:
    > list: a list of projects assigned
    > show: individual project; show tasks; buttons to delete or edit on a project
    > edit: edit project; edit tasks; edit assigned user
    > delete: delete project (show as finish?); delete tasks
    > new: add new projects; create new tasks; create and assign new users; 
    > finished_projects: list of finished projects (with tasks?)

Models
> user
    > has_many :tasks
    > has_many :projects, through: :tasks
    > has_secure_password
> tasks
    > belongs_to :project
    > belongs_to :user
> projects
    > has_many :tasks
    > has_many :users, through: :tasks

