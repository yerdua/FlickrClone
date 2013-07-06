FlickrClone.Collections.Albums = Backbone.Collection.extend({

  model: FlickrClone.Models.Album,
  
  url: '/albums'

});
