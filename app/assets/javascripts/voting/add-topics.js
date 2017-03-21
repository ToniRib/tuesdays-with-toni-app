$(document).ready(function() {
  $('#suggested-topics').empty();
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
  if (topic.voting_allowed) { addUpvoteHandler(topic); }
};

var addUpvoteHandler = function(topic) {
  $('#suggested-topic-' + topic.id).find('.upvote').click(upvoteHandler);
};

var upvoteHandler = function() {
  var topicId = $(this).parents('.suggested-topic').attr('id').split('-')[2];
  addUserVote(topicId);
};

var addUserVote = function(topicId) {
  $.ajax({
    type: 'POST',
    url: '/api/v1/user_votes',
    data: {
      suggested_topic: {
        id: topicId
      }
    },
    success: function(data) {
      var $topic = $('#suggested-topic-' + topicId);

      $topic.find('.vote-count').html(data.new_vote_count);
      $topic.find('.vote-name').html('votes');
      $topic.find('.upvote').remove();
    }
  });
};

var topicString = function(topic) {
  return '<li class="suggested-topic" id="suggested-topic-' + topic.id + '">' +
         topic.name + ' (' + currentVoteCount(topic.name, topic.vote_count) + ')' +
         upvote(topic) + '</li>';
};

var upvote = function(topic) {
  if (topic.voting_allowed) {
    return '<button class="upvote btn">⇧</button>';
  } else {
    return '';
  }
};

var currentVoteCount = function(topicName, voteCount) {
  if (voteCount > 1) {
    return "<span class='vote-count'>" + voteCount + "</span> <span class='vote-name'>votes</span>";
  } else {
    return "<span class='vote-count'>1</span> <span class='vote-name'>vote</span>";
  }
};
