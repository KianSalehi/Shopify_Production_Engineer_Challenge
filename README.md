# Shopify Production Engineer Challenge

## Table of Contents

- [About the Project](#about)
   - [Replit Demo](#replit-demo) 
   - [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
   - [Git Installation](#git-installation)
   - [Ruby Installation](#ruby-installation)
   - [SQLite Installation](#sqlite-installation)
   - [Rails Installation](#rails-installation)
  - [Installation of the Project](#installation-of-the-project)
- [Tests](#tests)
  - [Running the Tests](#running-the-tests)
- [Usage](#usage)
- [Feature](#feature)

## About
Hi! My name is Kian, and this is my Shopify Production Engineer Challenge repository. I have taken a challenge upon myself to learn Ruby on Rails from the posting time of this challenge and managed to develop this project as result of my learnings. This project has all the CRUD functionalities required for inventory tracking for a logistics company. Each product in the application should be associated with a city and an OpenWeather API endpoint is used to get the weather information about the city of the product. By clicking on "show" action button on each item on the list, the user is given the option to extract the data as a CSV file in the product details page. There are Integration, Model, Controller, and CRUD functionality tests written for this project to keep a good quality control on the code. The CSV functionality was implemented using the CSV builtin model by Ruby. 

## Replit Demo
! The Demo might take couple minutes to load !

[Demo link for the challenge](https://ShopifyProductionEngineerChallenge.kiansalehi.repl.co) 

## Technologies Used
* Ruby 3.1.2
* Rails 7.0.2
* SQLite 1.4
* OpenWeather "Current Weather Data" API endpoint used for weather retrieval of weather description
* Replit as the hosting platform

# Getting Started
## Prerequisites
* Git
* SQLite
* Ruby
* Rails

Above technologies are required to run the application on your local device.
## Git Installation
Download the git installer from [Git](https://git-scm.com/downloads) follow the installation steps to install git on your device.
## Ruby Installation
Download and install Ruby from [Ruby](https://www.ruby-lang.org/en/downloads/) and follow the installation steps to install Ruby on your device.
! If you are using macOS or Linux/UNIX you might need [rbenv](https://github.com/rbenv/rbenv) or [RVM](http://rvm.io/) on your device !
## SQLite Installation
Download and install SQLite from [SQLite](https://www.sqlite.org/download.html) and select the binaries based off of your operating system
## Rails Installation
After installation of Ruby and SQLite you can use the command line to install Rails using the following command
```terminal
> gem install rails
```
To check if you have the dependencies you can execute the following commands in your terminal
```terminal
> ruby -v
```
```terminal
> sqlite3 --version
```terminal
> rails --version
```terminal
> git --version
```
## Installation of the Project
! UNIX based operating systems might require sudo in front of the following commands for permissions. !
1- Clone the repo
```git
> git clone https://github.com/KianSalehi/Shopify_Production_Engineer_Challenge.git
```
2- Navigate to the root directory of the cloned project by
```terminal
> cd Shopify_Production_Engineer_Challenge
```
Enter your OpenWeather API in the products_controller.rb file at /app/controller/ directory instead of APIKEY variable as shown bellow (the key needs to be in quotations like "key08408990489490"):

![OpenWeather API Key Variable](/readme_pictures/OpenWeather_API_Key.png)

And run the commands
```terminal
> bundle update
> bundle install
> rails db:migration
> rails s
```
At this point you should have the project running in your local device. The address to the application web page should be given as shown in the following image:

![Web Page Address From the Console](/readme_pictures/Console_starting_project_link.png)

## Tests
There are a total of 19 tests with 36 assertions in this project.

![Console Showing The Tests And Assertions](/readme_pictures/Tests.png)

Three types of tests were written:
* Unit tests 
    * product_test.rb
* Functional tests
    * products_controller_test.rb
* Integration tests
    * create_item_test.rb
    * list_item_test.rb

! Unit tests cover the validations for the product object as well !

## Running the Tests

Note: OpenWeather API key needs to be placed as shown in the image below to run the tests.

Enter your OpenWeather API in the products_controller.rb file at /app/controller/ directory instead of APIKEY variable as shown bellow (the key needs to be in quotations like "key08408990489490"):

![OpenWeather API Key Variable](/readme_pictures/OpenWeather_API_Key.png)

## Usage
The home page contains all the items in the inventory.

![Index Page](/readme_pictures/List_Items_Index.png)

All the CRUD functionality are given as the image shown above. Under the Actions section of the table the user can see the details on a specific product by clicking on the show button. 

Edit and Delete under the action tab correspond to the Update and Destroy functionality of CRUD and the Create New Product corresponds to the Create part of CRUD. 

## Feature

CSV extraction for each item was made possible using the products controller show function and model function to_csv, which uses the CSV model to convert the data to a csv file.

In the Show page, there is "Export to CSV" to export the product data to a downloadable CSV file.

![Extract CSV](/readme_pictures/Extracting_CSV.png)
