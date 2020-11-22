
:- dynamic(currentQuest/4).
:- dynamic(progressQuest/3).

%quest(QuestId, ShredderCount, OozmaCount, KappaCount, MoneyReward, ExpReward)

quest(1, 1, 1, 1, 50, 100).
quest(2, 0, 3, 3, 100, 150).
quest(3, 5, 0, 2, 75, 125).
quest(4, 2, 2, 2, 100, 150).
quest(5, 3, 5, 4, 200, 300).
quest(6, 7, 4, 0, 150, 250).



%progressQuest(QuestId, ShredderCount, OozmaCount, KappaCount)

initProgressQuest :- asserta(progressQuest(0, 0, 0, 0)).



getQuest :-
	progressQuest(QuestId, SC, OC, KC),
	random(1, 7, NewQuestId),
	retract(progressQuest(QuestId, SC, OC, KC)),
	asserta(progressQuest(NewQuestId, 0, 0, 0)), !.



addShredderCount :-
	progressQuest(QuestId, SC, OC, KC),
	NewSC is SC + 1,
	retract(progressQuest(QuestId, SC, OC, KC)),
	asserta(progressQuest(QuestId, NewSC, OC, KC)).

addOozmaCount :-
	progressQuest(QuestId, SC, OC, KC),
	NewOC is OC + 1,
	retract(progressQuest(QuestId, SC, OC, KC)),
	asserta(progressQuest(QuestId, SC, NewOC, KC)).

addKappaCount :-
	progressQuest(QuestId, SC, OC, KC),
	NewKC is KC + 1,
	retract(progressQuest(QuestId, SC, OC, KC)),
	asserta(progressQuest(QuestId, SC, OC, NewKC)).



questDone:-
	progressQuest(QuestId, PlayerSC, PlayerOC, PlayerKC),
	quest(QuestId, ReqSC, ReqOC, ReqKC, _, _),
	PlayerSC >= ReqSC,
	PlayerOC >= ReqOC,
	PlayerKC >= ReqKC.
