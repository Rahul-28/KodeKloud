sudo useradd -e 2027-03-28 anita

# Verify the user was created with the correct expiry date
# sudo chage -l anita

# output
# Last password change                                    : Jan 22, 2026
# Password expires                                        : never
# Password inactive                                       : never
# Account expires                                         : Mar 28, 2027
# Minimum number of days between password change          : 0
# Maximum number of days between password change          : 99999
# Number of days of warning before password expires       : 7

