# README - CodingTutor



URL: www.blahblahblah.herokuapps.com
---
## Description
### Problem Definition / Purpose

CodingTutor is a two-way tutoring marketplace for Software Developers based in Australia. Students can search for and select Tutors based primaritly on skill set, location and reputation, and book a session by themself or teaming up with other students as a group. 

### Functionality / Features
- screenshots

### Tech Stack
- HTML, CSS, SASS
- Ruby, Ruby on Rails
- Heroku

### Configuration / Installation Instructions 
Gmail account
email address: ca.codingtutor@gmail.com
password: nl*V@hKGZ1I6

---
## Design Documentation



### Design process

### User stories / User Journey
- stories
- Workflow diagram of user journey/s.

### Wireframes

### ERD (Entity Relationship Diagrams)

---
## Planning process
- project plan & timeline
- Screenshots of Trello board(s)

---
## Answers to the Short Answer questions (Section 2.2)

by Josh & Sunny

--- 
## Josh Notes

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

