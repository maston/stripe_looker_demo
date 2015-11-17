- view: user_info
  derived_table:
    sql: |
            SELECT
              U.USER_ID,
              U.DT_SIGNUP,
              U.USER_GENDER,
              U.USER_AGE_GROUP,
              U.USER_STATE,
              S.DT_JOINED,
              S.PLAN_TYPE,
              S.DT_CANCELLED
            FROM USER_SIGNUPS U
            LEFT JOIN USER_SUBSCRIPTIONS S 
            ON U.USER_ID = S.USER_ID

  fields:

  - dimension: user_id
    type: int
    sql: ${TABLE}.USER_ID

  - dimension: signup
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_SIGNUP

  - dimension: user_gender
    type: string
    sql: |
      CASE 
        WHEN ${TABLE}.USER_GENDER=0 THEN 'Male'
        WHEN ${TABLE}.USER_GENDER=1 THEN 'Female'
        ELSE 'N/A'
      END

  - dimension: user_age_group
    type: string
    sql: |
      CASE 
        WHEN ${TABLE}.USER_AGE_GROUP=1 THEN 'A. under 21'
        WHEN ${TABLE}.USER_AGE_GROUP=2 THEN 'B. 21 - 25'
        WHEN ${TABLE}.USER_AGE_GROUP=3 THEN 'C. 26 - 30'
        WHEN ${TABLE}.USER_AGE_GROUP=4 THEN 'D. 31 - 40'
        WHEN ${TABLE}.USER_AGE_GROUP=5 THEN 'E. 40+'
        ELSE 'N/A'
      END
      
  - dimension: user_state
    type: string
    sql: ${TABLE}.USER_STATE

  - dimension: subscription_start
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_JOINED

  - dimension: plan_type
    type: string
    sql: |
      CASE 
        WHEN ${TABLE}.PLAN_TYPE=0 THEN 'Free Trial'
        WHEN ${TABLE}.PLAN_TYPE=1 THEN 'Bronze'
        WHEN ${TABLE}.PLAN_TYPE=2 THEN 'Silver'
        WHEN ${TABLE}.PLAN_TYPE=3 THEN 'Gold'
        ELSE 'N/A'
      END

  - dimension: is_cancelled
    type: yesno
    sql: |
      ${TABLE}.DT_CANCELLED IS NOT NULL
    
  - dimension: subscription_cancelled
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_CANCELLED IS NOT NULL


  - dimension: day_from_signup_to_paid
    type: tier
    tiers: [0,7,14,30,60,90]
    style: relational
    sql: |
      DAYS(${TABLE}.DT_JOINED) - DAYS(${TABLE}.DT_SIGNUP)

  - measure: count
    type: count
    drill_fields: detail*
