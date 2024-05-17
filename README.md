# README

## Running app on local machine
1. Clone the repo.
2. **Run** the following command.
```bash
cd pup_pix
```
```bash
bundle install
```
```bash
yarn install
```

Run server
```bash
rails s
```

Run dev server. In order to run dev server with HMR feature you need to parallely run:
```bash
./bin/shakapacker-dev-server
```




### Folder Structure
1. **View** - This folder contains the display templates to fill data in our application.
2. **Controller** - All the controller files are stored here. A controller handles all the web requests from the user.
3. **Interactors** - This folder have the appilcations business logic. It is called in controllers or organizers.
4. **Validators** - Custom validation for interactors.