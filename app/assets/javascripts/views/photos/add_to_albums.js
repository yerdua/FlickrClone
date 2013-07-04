FlickrClone.Views.PhotoAddToAlbums = Backbone.View.extend({
  
  template: JST['photos/add_to_albums'],
  
  render: function () {
    var renderedContent = this.template({});
    this.$el.html(renderedContent);
    
    return this;
  }

});
