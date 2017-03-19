* Ruby version
  - 2.4.0

* Database creation
  - `bin/rails db:create`
  - `bin/rails db:migrate`

* Database initialization
  - `bin/rails db:seed`
  - If uuid-ossp is not installed in postgresql, please execute this command.
    - `ALTER USER lassi WITH SUPERUSER;`
    - `CREATE EXTENSION pgcrypto;`
    - `bin/rails db:migrate`

* How to run the test suite
  - `RAILS_ENV=test bin/rspec spec`

* About frontend
  - If yarn is not installed, please install yarn. Check [here](https://yarnpkg.com/lang/en/docs/install/) to install yarn.
    - In the case of OSX, `brew install yarn`.
  - `cd frontend`
  - `npm install` or `yarn install`
  - Use command `yarn run build` or `yarn run watch` when developing.

* Deployment instructions
