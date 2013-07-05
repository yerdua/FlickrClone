FlickrClone.Views.PhotoAlbumForm = Backbone.View.extend({
  
  template: JST['photos/album_form'],
  
  render: function () {
    var renderedContent = this.template({});
    this.$el.html(renderedContent);
    
    return this;
  }

});
