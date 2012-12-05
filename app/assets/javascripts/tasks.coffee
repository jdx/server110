$ ->
  $(".task .review_checkbox").change ->
    task = $(this).parent()
    task_id = task.data('task_id')
    reviewed = $(this).prop('checked')
    $.post "/tasks/#{task_id}/review",
      { reviewed: reviewed }, ->
        task.toggleClass('reviewed', reviewed)
