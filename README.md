Welcome to task_monkey gem!

Task Monkey is an everyday task management tool created for you. Each of your task assignments is managed through a project. You can create a project with tasks assigned. Signup/login is required to be able to view and manage your tasks. Have fun managing tasks!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'task_monkey'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install task_monkey


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Usage

Type the below and follow the on screen prompts.

$ task_monkey

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pipivybin/task_monkey. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in Task Monkey’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pipivybin/task_monkey/blob/master/CODE_OF_CONDUCT.md).

<!-- Three models
- User
    > username
    > password_digest
- Task
    > name
    > descrption
    > create_time format wrong !!!!!
    > Deadline format wrong !!!!!
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
- Project:
    #> list: a list of projects assigned
    #> show: individual project; show tasks; buttons to delete or edit on a project
    #> edit: edit project; edit tasks
    #> delete: delete project (show as finish?); 
    > delete tasks
    #> new: add new projects; create new tasks
    #> finished_projects: list of finished projects (with tasks?)

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

<------ finished projects view??
