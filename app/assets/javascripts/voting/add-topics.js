$(document).ready(function() {
  getLessonTopics();

  $('#add-topic').on('click', function() {
    saveTopic($('#topic').val());
  });

  $('#topic').on('keyup', function(e) {
    if (e.which === 13) {
      saveTopic($('#topic').val());
    }
  });
});

var saveTopic = function(topicName) {
  $.ajax({
    type: 'POST',
    url: '/api/v1/suggested_topics',
    data: {
      suggested_topic: {
        name: topicName
      }
    },
    success: function(topic) {
      appendTopic(topic);
      $('#topic').val('');
    },
    error: function(xhr) {
      var errorMessage = $.parseJSON(xhr.responseText).error[0];
      alert('Topic could not be saved! ' + errorMessage);
    }
  });
};

var getLessonTopics = function() {
  $.ajax({
    type: 'GET',
    url: '/api/v1/suggested_topics',
    success: function(topics) {
      addLessonTopicsToPage(topics);
    }
  });
};

var addLessonTopicsToPage = function(topics) {
  $.each(topics, function(index, topic) {
    appendTopic(topic);
  });
};

var appendTopic = function(topic) {
  $('#suggested-topics').append(topicString(topic));
};

var topicString = function(topic) {
  return '<li id="voted-lesson-topic-' + topic.id + '">' +
         topic.name + ' (' + currentVoteCount(topic.name, topic.vote_count) + ')' +
         upvote() + '</li>';
};

var upvote = function() {
  if (currentUsername !== '') {
    return '<span class="upvote"> ^ </span>';
  } else {
    return '';
  }
};

var currentVoteCount = function(topicName, voteCount) {
  if (voteCount > 1) {
    return voteCount + ' votes';
  } else {
    return '1 vote';
  }
};
