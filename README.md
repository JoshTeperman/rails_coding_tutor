# CodingTutor 

[GithHub Repo](https://github.com/JoshTeperman/rails_coding_tutor)\
[View Live Application](https://vast-citadel-37963.herokuapp.com/)

---
## Contents
<!-- links  -->
**[Section 1: Description](#description)**\
**[About](#about)**\
**[Tech Stack](#tech-stack)**\
**[Configuration](#configuration)**\
**[Section 2: Design](#description)**\
**[Wireframes](#wireframes)**\
**[ERD](#erd)**\
**[The Database](#the-database)**\
**[User Stories](#user-stories)**


## Section 1: DESCRIPTION

### __About CodingTutor__
<!-- General description of the app, its features-->
<!-- Screenshots -->

### __Tech Stack__
- Front-end: HTML, ERB, CSS, Sass, Javascript
- Back-end: Ruby, Ruby on Rails
- Database: PostgreSQL Database with ActiveRecord
- Deployment: Heroku

### __Configuration / Installation Instructions__
<!-- Copy  -->
1) Gmail account
  - emailress: ca.codingtutor@gmail.com
  - password: nl*V@hKGZ1I6

---
## Section 2: DESIGN

### __Design process__

### __User Journey__
![User Journeys Flowchart](./docs/user-journeys.png "User Journeys Flowchart")

### __Features__

---
## Section 3: PROCESS
- project plan & timeline
- Screenshots of Trello board(s)
- GitHub
- Progress

---
## Section 4: SHORT ANSWER QUESTIONS

### 1) What is the need (i.e. challenge) that you will be addressing in your project?

### 2) Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
CodingTutor is a two-way tutoring marketplace for Software Developers based in Australia. Students can search for and select Tutors based primaritly on skill set, location and reputation, and book a session by themself or teaming up with other students as a group. 

### 3) Describe the project will you be conducting and how. your App will address the needs.

### 4) Describe the network infrastructure the App may be based on.

### 5) Identify and describe the software to be used in your App.

### 6) Identify the database to be used in your App and provide a justification for your choice.

### 7) Identify and describe the production database setup (i.e. postgres instance).

### 8) Describe the architecture of your App.

### 9) Explain the different high-level components (abstractions) in your App.

### 10) Detail any third party services that your App will use.

### 11) Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

### 12) Discuss the database relations to be implemented.

### 13) Describe your project’s models in terms of the relationships (active record associations) they have with each other.

### 14) Provide your database schema design.
[View at dbdesigner.net](https://www.dbdesigner.net/designer/schema/243055)

![ERD](./docs/ERD.png "ERD")

### 15) Provide User stories for your App.

__USER STORIES__

1) *"As a Guest (User who is not signed in), I should be able to ..."*
- View the Home Page, read about the app's purpose and it's basic functionality
- View a clear call to action on the front page 'Find a Tutor' that links to the Index/Search page. 
- View more information / tutorials on how to use the app, including what it means to be a tutor
- View Contact Details to get in touch with the creators and find out more
- Create a new Account with an email address and password, and receive and email to confirm creation of my new account
2) *"As a Student (Normal User), I should be able to ..."*
- Login and create a Profile, write a bio, list my skills, and upload an optional avatar photo. Edit my profile at any time
- Use a default profile avatar photo
- View all of the Tutor's active on the platform, including their profile details (bio, skills), as well as hourly rate. 
- Select a tutor and create a new booking with that tutor. 
- Have the booking price be calculated automatically based on the duration and tutor's hourly rate. Pay for the booking using Stripe and my Credit Card, and view a confirmaton screen when the payment has been processed. 
- Write a review for any Tutor. 
- Edit or cancel any (and only) bookings I am a participant in
- Review my past bookings and upcoming bookings, whicih includes booking data and time, tutor name, and students who participated in the booking
- Edit / Delete and (and only) reviews I created
- Have the option to create a Tutor account by checking a box on the Create Profile page

3) *"As a Tutor, I should be able to ..."*
- Have all the same functionality as a normal user (Tutors can be Students as well)
- Decide at any time whether uncheck the tutor option, which hides my profile from the Tutors index page. I should still be able to see my tutor history (my students, past bookings) in my own private page. 
- View my student profiles (cannot see profiles of users who are not my students)
- View reviews of myself

4) *"As an Administrator User, I should be able to ..."*
- Edit / Delete content, including reviews and bookings
- View an Administrator Dashboard
- View all profiles and all bookings
- View financial data

5) *"As a Moderator User, I should be able to ..."*
- Edit and delete reviews only

__Bucket List User Stories for Version 1.1__

*"In the next version of our app, users should be able to..."* 

1) __Normal Users__
- Search / Sort / Filter Tutor Profiles based on name, skills, location
- Add multiple students to a booking
- Request changes to a booking and have Tutors accept or reject changes
- Send messages to other users
- Follow or 'favourite' tutors
- Make a complaint about a tutor who behaved inappropriately
- View Notifications (inbox message etc)
- View upcoming bookings in calendar style
- Directly add bookings to Google Calendar 
- Set up video calls directly through the platform
- Set up recurring meetings 

2) __Tutors__
- Confirm or reject changes / requests for new bookings before a booking can be created
- Create and review lesson notes
- Append notes to students 
- Review financial data

3) __Administrators & Moderators__ 
- Admins create Moderator users
- View detailed user stats (filter by location, skills, activity etc)
- View user history
- Receive notifications for flagged content, 
- Moderators can escalate issues to Moderators


### 16) Provide Wireframes for your App.
[View at Figma.com](https://www.figma.com/file/N3IWB9shy8LfcphJliE2F1rz/Rails_Project?node-id=72%3A117)

### 17) Describe the way tasks are allocated and tracked in your project.

### 18) Discuss how Agile methodology is being implemented in your project.

### 19) Provide an overview and description of your Source control process.

### 20) Provide an overview and description of your Testing process.

### 21) Discuss and analyse requirements related to information system security.

### 22) Discuss methods you will use to protect information and data.

### 23) Research what your legal obligations are in relation to handling user data.

---
## Section 4: Reflection
### Challenges
- what was difficult?
### What we learned
- how would we do things differently next time?
### Extending the App
- what features would we add? 
### Maintenance
- any requirements for ongoing management of the app

--- 
## Section 5: Appendix

### SINGLE PAGE SCROLLING
https://www.uxpin.com/studio/blog/4-types-creative-website-scrolling-patterns/
> We have selected a fixed long-scrolling pattern for displaying content on our website. Long-scrolling is suitable for applications where the content of the webstie is either a) user generated and therefore constantly being updated b) either diverse and difficult to categorise or alternatively all of a particularly type and can be listed all together, as is the case with our site. 
> Long-scrolling pattern websites have the downside of becoming difficult to navigate, particularly when trying to 'go back', or return to a previous point. To combat this we have adopted fixed menu bars and search filter for the Search page, and fixed return buttons for the Home page. 
> Fixed long-scrolling websites provide some additional structure to a long-scrolling pattern - suitable for an About Page / Sales Page / Tutorial Page that describes a product or service to a new user, with CTA at the end of each section and # links to each section. This format replaces a multi-page format with a single page but avoids users getting lost by keeping some structure.
> Consider some indicator of scrolling progress for the user so they know how far they've scrolled (scrollbar etc)
> Single-page scrolling can affect SEO results (Mitigation: http://www.quicksprout.com/2014/05/21/how-to-create-an-seo-friendly-infinite-scrolling-page/)
> Can combine long scrolling with link-out to secondary pages (www.facebook.com)(www.twitter.com)(www.linkedin.com)
> Consider Infinite Scrolling for search results (limit initial view to X results, load more on scroll)

References: 
https://www.uxpin.com/studio/blog/4-types-creative-website-scrolling-patterns/

### SEARCH / FILTERING
Challenge / Goal:
- App users need a way to find the right tutor for them, either with a targeted search for a specific tutor (search by Name), or with a filter (search by skill / language, location)
- Therefore we need 
  -- Keyword search (limited to specific scope / field)
  -- Filters (predefined and given to the user)
  -- Easy to use UI (look at different options - lists / checkboxes etc)
  -- Stretch Goals:
    -- Filter-as-you-type
    -- Display results without refreshing
    -- Auto-complete
    -- Saved Search results

Looking for Natively coded solutions as first priority for several reasons:
a) Search and filter requirements for this project are relatively simple and straightforwared - single page search and filter, uniform data, limited number of results, limited complexity of database queries, not expecting complex search parameters - therefore only requires a simple solution  
b) the greater the complexity of the solution the greater the dependencies / technical debt / increased risk of error and bugs 
c) complex solutions will require increased study / implementation time 
d) introducing additional languages / modules gems on top of Rails / Ruby will make it more difficult to make changes to meet unknownn requirements in the future. Keeping things natively coded will mean we can simply update the logic locally in our controller as opposed to modifying the installation of gems / modules accross the application. 


Rails solutions:
Using Scopes & Models: https://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
Using Scopes (2): https://guides.rubyonrails.org/active_record_querying.html#scopes
Search in Rails: http://www.korenlc.com/creating-a-simple-search-in-rails-4/
Search in Rails(2): https://rubyplus.com/articles/3381-Simple-Search-Form-in-Rails-5
RoR Tags: https://www.sitepoint.com/liberate-your-search-in-rails-with-tags/

Gems: 
Lappen: https://github.com/tbuehlmann/lappen
Has Scope https://github.com/plataformatec/has_scope
FilTeriffic https://github.com/jhund/filterrific
Smart Listing https://github.com/Sology/smart_listing
Ransack https://github.com/activerecord-hackery/ransack
Sunspot: https://github.com/sunspot/sunspot
SearchKick: https://github.com/ankane/searchkick
Thinking Sphinx: https://github.com/pat/thinking-sphinx
Search Logic: https://github.com/binarylogic/searchlogic

Javascript Solutions (including modules):
JQuery: https://www.w3schools.com/jquery/jquery_filters.asp
JavaScript: https://www.w3schools.com/howto/howto_js_filter_lists.asp
List.js (JS library to add search / sort to HTML): https://listjs.com/docs/

High Powered solutions to consider at a later date: 
Elastic Search: http://www.elasticsearch.org/
Solr: https://lucene.apache.org/solr/
Swiftype Elastic Search: https://swiftype.com/documentation/site-search/tutorials/rails

Other references:
https://www.reddit.com/r/rails/comments/6094kv/the_best_way_to_implement_filters_and_searching/
Native Rails Solutions: https://stackoverflow.com/questions/15474883/rails-how-to-filter-results
Autocomplete: https://www.sitepoint.com/search-autocomplete-rails-apps/
Autocomplete (2): https://gorails.com/episodes/global-autocomplete-search

