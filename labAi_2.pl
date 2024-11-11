:- dynamic task/4.

create_task(TaskID, Description, Assignee) :-
    \+ task(TaskID, _, _, _),
    assert(task(TaskID, Description, Assignee, false)),
    format('Task created: ~w.~n', [TaskID]).

assign_task(TaskID, User) :-
    task(TaskID, Description, OldAssignee, Completed),
    retract(task(TaskID, Description, OldAssignee, Completed)),
    assert(task(TaskID, Description, User, Completed)),
    format('Task ~w assigned to user: ~w.~n', [TaskID, User]).

mark_completed(TaskID) :-
    task(TaskID, Description, Assignee, false),
    retract(task(TaskID, Description, Assignee, false)),
    assert(task(TaskID, Description, Assignee, true)),
    format('Task ~w marked as completed.~n', [TaskID]).
mark_completed(TaskID) :-
    task(TaskID, Description, Assignee, true),
    format('Task ~w is already completed.~n', [TaskID]).

display_tasks :-
    findall(TaskID, task(TaskID, _, _, _), TaskIDs),
    display_tasks_list(TaskIDs).

display_tasks_list([]).
display_tasks_list([TaskID | Rest]) :-
    task(TaskID, Description, Assignee, Completed),
    format('Task ~w:~n', [TaskID]),
    format('- Description: ~w~n', [Description]),
    format('- Assignee: ~w~n', [Assignee]),
    format('- Completion status: ~w~n', [Completed]),
    display_tasks_list(Rest).

display_tasks_assigned_to(User) :-
    findall(TaskID, task(TaskID, _, User, _), TaskIDs),
    format('Tasks assigned to ~w:~n', [User]),
    display_tasks_list(TaskIDs).

display_completed_tasks :-
    findall(TaskID, task(TaskID, _, _, true), TaskIDs),
    format('Completed tasks:~n'),
    display_tasks_list(TaskIDs).
