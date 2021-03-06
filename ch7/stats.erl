-module(stats).
-export([minimum/1, maximum/1, range/1, mean/1, stdv/1]).

minimum(List) ->
	[First | Remainder] = List,
	minimum(Remainder, First).

minimum(List, SmallestNum) ->
	if
		List =:= [] ->
			SmallestNum;
		hd(List) < SmallestNum ->
			minimum(tl(List), hd(List));
		true ->
			minimum(tl(List), SmallestNum)
	end.

maximum(List) ->
	[First | Remainder] = List,
	maximum(Remainder, First).

maximum(List, LargestNum) ->
	if 
		List =:= [] ->
			LargestNum;
		hd(List) > LargestNum ->
			maximum(tl(List), hd(List));
		true ->
			maximum(tl(List), LargestNum)
	end.

range(List) -> [minimum(List), maximum(List)].


mean(List) ->
	Length = length(List),
	Sum = lists:foldl(fun (X, Sum) -> Sum + X end, 0, List),
	Sum / Length.

stdv(List) ->
	List.