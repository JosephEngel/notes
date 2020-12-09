# /etc/shadow Info

## Format
* Each line is a user's information, using a colen `:` delimiter to separate the 8 fields
* Field Info:
  1. **Username**
  2. **Password** : Encrypted password; formatted as `$id$salt$hash`
  3. **Last Password Change (lastchanged)** :Days since Jan 1, 1970 that password was last changed
  4. **Minimum** : The minimum number of days required between password changes i.e. the number of days left before the user is allowed to change his/her password
  5. **Maximum** : The maximum number of days the password is valid (after that user is forced to change his/her password)
  6. **Warn** : The number of days before password is to expire that user is warned that his/her password must be changed
  7. **Inactive** : The number of days after password expires that account is disabled
  8. **Expire** : days since Jan 1, 1970 that account is disabled i.e. an absolute date specifying when the login may no longer be used

Example:
```
joey:$6$1d4dBBwjh2fjS6.k$rPifDmgz1TmfKEos93kfgmkNE1AXO3aH/FyYdklNk3OydAacAr6lQYVE4bcFi57h/NH3o5X7wIdiJ3f3UFTsa/::0:99999:7:::
```
1. **Username**: joey
2. **Password**:
   * id: sha512
   * salt: 1d4dBBwjh2fjS6.k
   * hash: rPifDmgz1TmfKEos93kfgmkNE1AXO3aH/FyYdklNk3OydAacAr6lQYVE4bcFi57h/NH3o5X7wIdiJ3f3UFTsa/
3. **lastchanged**: N/A
4. **Minimum**: 0
5. **Maximum**: 99999 (max days)
6. **Warn**: 7 days
7. **Inactive**: N/A
8. **Expire**: N/A

