Week 2 Day 3 - Assignment
============

# Contact List - A CLI App

## Introduction

**Goal:** Build a ruby command line application to help users manage their contacts through a REPL (Read-eval-print-loop) interface.

**Repository:** Create a repository for this project (instead of working within the gist).

**Duration:** You should aim to have your app completed by the end of tomorrow. It is a _two day_ project.

**Reminders & Tips:**
* You will need to stop and restart the application after any code changes for it to be noticed in the running application. Ctrl+C sends a termination signal to help you quit
* If you restart your app, all the contacts will be lost
* Commit and push your progress on a regular basis
* Seed some fake data in so you don’t have to create contacts each time you restart the app

## Setup

The project will be written in an Object Oriented way. Each contact will be represented by am instance of the `Contact` object. Similarly, the main application (responsible for user input and output) will be managed via an instance of `Application`.

Use the code provided. However, instead of cloning this gist, simply copy/paste the code from it into your own brand new folder (create the folder and `git init` it), keeping the file names consistent of course.

To run the code, execute the following command from the project directory (within vagrant):

    ruby main.rb

## Testing

It is recommended that you write tests for the Contact class.
However, it will be more involved to write tests for methods in the `Application` class. As such, you can skip writing tests for this class (for now)

## Task Breakdown

### Task 1: Main menu and user input

When the app starts up it should initially display a menu with options. It then prompts them for input. At this stage, it can just ignore the input and reprint the main menu. In the next task, we will start using the input.

**The menu:**
    What would you like do next?
    new  - Create a new contact
    list - List all contacts
    quit - Exit Application
    > _

### Task 2: Implement Exit functionality (`quit` command)

If, on the main menu, the user inputs quit, then the app should break out of the REPL, causing the program to terminate. If you’re feeling generous, wish the user adéu first.

### Task 3: Implement contact creation (`new` command)

If the user types in `new` into the prompt at the main menu, the command line app should further prompt the user for information about the contact they wish to create. Eg: take a full name and email (separately). These should be added to an (initially empty) array of contacts. The full name and the email should be input as separate strings as they will need to be output as such.

Once a user has entered the data, the app should take them back to the main menu. Every time the user returns to the main menu, all the options of the main menu should be re-printed for the user to see all the available options.

### Task 4: Implement Contact index (`list` command)

When on the main menu, the user can type in list to display a list of all contacts within the app, printed one on each line. Each line should be formatted as:

   #: <first name> <last initial> (<email>)

The number (#) should start with 0 and represents an index or unique ID for each contact. Once the contacts are printed out to the screen, the app should go back to the main menu.


## Bonus Features

### Bonus 1: Contact details (`show` command)

When on the main menu, the user can type in `show` along with an id (index) of the contact to display their details. If a contact with that index/id is found, display their details, with each field being printed on an individual line. If the contact cannot be found, display a "not found" message.

### Bonus 2: Implement Contact search (`find` command)

After typing in a `find` command, along with a search term, the app will search through the names of the contacts and print the contact details of any contacts which have the search term contained within their name or email. (ie. the search term is a substring of the contact’s email or name)

Example use:
   find ted


### Bonus 3: Prevent duplicate entries

If a user tries to input the exact a contact with a the same email address twice, the app should output an error saying that the contact already exists and cannot be created. If you are asking for name first and then email, for a better user experience, it may make more sense to ask for their email first and then their name.

### Bonus 4: Multiple phone numbers

Implement the ability to add contact’s phone numbers. Contacts can have a limitless amount of phone numbers. Each phone number has a label and the number itself (eg: "Mobile" and "444-555-3123")

### Bonus 5: Persistence

Save / load contact information from a [CSV file](http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html). You are free to structure the file fields/columns as you see fit.

When the app starts, it will look for this file. If the file is there, it should load all the contacts from it. In order to do this in an OOP way, you should introduce a ContactDatabase class that is responsible for reading and writing this file. For simplicity, only read from this file once (when the apps starts) and only write to it once (when the user `quit`s the app).
