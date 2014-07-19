Polymer('tb-classrooms', {
  ready: function() {
    this.classrooms = [];
    this.csrfToken = document.querySelector('[name=csrf-token]').content;
  },

  page: 0,

  transition: function(e) {
    if (this.page === 0) {
      this.selectedClassroom = e.detail.data;
      this.page = 1;
    } else {
      delete this.selectedClassroom;
      this.page = 0;
    }
  },

  /**
   * Show or hide the new classroom form
   */
  toggleDialog: function() {
    this.shadowRoot.querySelector('tb-new-classroom-form').toggle();
  },

  /**
   * Add the retrieved classrooms to the model
   */
  classroomsLoaded: function(e) {
    this.classrooms = e.detail.response.classrooms;
  },

  /**
   * Append a newly created classroom to the list
   */
  classroomCreated: function(e) {
    this.classrooms.push(e.detail.response);
    // TODO: Fix the bug where it's appended at the bottom then shifts to the top after a refresh. 
  },

  removeDeletedClassroom: function(e, classroom) {
    this.deletedClassroom = classroom.name;
    this.classrooms = this.classrooms.filter(function(obj) {
      return obj.id !== classroom.id;
    });
    this.shadowRoot.querySelector('paper-toast.classroom-deleted').show();
    
  }
});

