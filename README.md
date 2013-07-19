FlickrClone
======

This is the result of spending about a week making a copy of [Flickr.com](http://www.flickr.com). Not all of the functionality is here, obviously.

So, what does this do? You can read more about this, or you can go play with it on heroku: [http://flickrclone.herokuapp.com/](http://flickrclone.herokuapp.com/)

### User sign up

If users are going to do anything at all on the site, and have it associated with them, they'll need an account. Even though this is only a demo project, I wanted to work with supporting pseudonymity and anonymity. With this goal in mind, users can sign up with or without an email address. Also, it's not required that a user creates an account at all - more on that later...

### Photo upload

A signed in user can upload one photo at a time. When choosing a photo, the user can add a title and description. They can also add this photo to an existing album or a group. When uploading as an anonymous user, a you can choose groups from a list of groups that allow posts by non-members.

### Albums

A signed in user can create photo albums. A list of these is accessible from the user's page. An album's page shows all the photos currently in that album. On a photo's page, there's an option to add or remove that photo from albums.

### Groups

When creating or editing a group, the user can specify if non-members are allowed to post to the group. When this option is selected, anonymous members can add photos. On a photo's page, the user (anonymous or signed in) can add the photo to a group. The list is filtered by what groups the user is allowed to post to.

### Contacts

When viewing other user's pages, the current user can add them as a friend. The photostream for contacts shows the most recent 3 photos for each contact.

---

### Future things

If I continue working on this, I'll work on the problem of anonymizing photos. Step 1 is to make sure EXIF data is removed. Step 2 is harder - process the images such that the camera can't be identified by its sensor noise fingerprint (google 'sensor noise fingerprint' if you'd like to be upset). I haven't found good information on how to do this. It's an interesting problem, but was beyond the scope of a week long project.
