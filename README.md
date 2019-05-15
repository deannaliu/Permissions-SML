# Permissions SML

Program computes the permissions for all the users in a course. 

### Consider the following sets:
- `USERS` set of users
- `ROLES` set of roles
- `PERMS` set of permissions
- `UR` set of user-role pairs is subset of USERS * ROLES
- `RP` set of role-permission pairs is subset of ROLES * PERMS
- `RR` set of pairs of roles, called ascendant and descendant roles, where an ascendant role inherits all permissions from a descendant role. This role hierarchy is transitive.

#### Example Input
```
authorizedRoles("1", [("1","1"), ("1","2")], [("3", "4"), ("2", "3"), ("1", "2")]);
authorizedPermissions("1", ["1","2","3","4"], [("1","2"), ("1","3"), ("2","2"), ("5", "4")]);
authorizedPermissions("1", ["2","3","4"], [("1","2"), ("1","3"), ("2","2"), ("3","5"), ("4","6"), ("6","9")]); 

```

#### Example Output
```
val it = ["1","2","3","4"] : string list
val it = ["2","3"] : string list
val it = ["2","5","6"] : string list

```
