fun matchUserRoles (u, []) = []
    | matchUserRoles (u, (x,y)::tail) = if u=x then y :: matchUserRoles (u,tail) else matchUserRoles (u,tail); 
fun test([], [], [], []) = []
    | test(l1, [], [], l3) = []
    | test(l1, z::zs, [], l3) = test(l1, zs, l3, l3)
    | test(l1, [], (x,y)::tail, l3) = l1
    | test (l1, z::zs, (x,y)::tail, l3) = if(z = x) then (y::test(l1, z::zs, tail, l3)) else test(l1,z::zs, tail, l3);
fun test2([], [], [], []) = []
    | test2(l1, [], [], l3) = []
    | test2(l1, z::zs, [], l3) = test2(l1, zs, l3, l3)
    | test2(l1, [], (x,y)::tail, l3) = []
    | test2(l1, z::zs, (x,y)::tail, l3) = if(z = x) then (y::test2(l1, z::zs, tail, l3)) else test2(l1,z::zs, tail, l3) ;
fun keepgo(x, [], [], [], []) = []
    | keepgo(x, l1, l2, [], []) = []
    | keepgo(x, [], [], l3, l4) = []
    | keepgo(x, l1, l2, l3, l4) = if(test(l1, l2, l3, l4) <> []) then test(test(l1, l2, l3, l4), test(l1, l2, l3, l4), l3, l4) else [x];
fun sort(y) = ListMergeSort.sort (fn(x:string,y)=> x>y) y;
fun removeDupes [] = [] | removeDupes (x::xs) = x::removeDupes(List.filter (fn y => y <> x) xs)
fun round(x, l1, l2, l3, l4) = keepgo(x, sort(removeDupes(keepgo(x, l1, l2, l3, l4))), sort(removeDupes(keepgo(x, l1, l2, l3, l4))), l3, l4)
fun authorizedRoles("", [], []) = []
    | authorizedRoles(User, ListUserRoleTuples, ListRoleRoleTuples) = sort(removeDupes(round(User, matchUserRoles(User, ListUserRoleTuples), matchUserRoles(User, ListUserRoleTuples), ListRoleRoleTuples, ListRoleRoleTuples)));
fun authorizedPermissions(User, UserAuthorizedRoles, ListRolePermissionTuples) = sort(removeDupes(test2(UserAuthorizedRoles, UserAuthorizedRoles, ListRolePermissionTuples, ListRolePermissionTuples)));
