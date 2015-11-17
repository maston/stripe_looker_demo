- view: user_subscriptions
  sql_table_name: USER_SUBSCRIPTIONS
  fields:

  - dimension: subscription_cancelled
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_CANCELLED
  
  - dimension: is_cancelled
    type: yesno
    sql: |
      ${TABLE}.DT_CANCELLED IS NULL

  - dimension_group: subscription_start
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

  - dimension: user_id
    type: int
    sql: ${TABLE}.USER_ID
    primary_key: true
    hidden: true
  
  - dimension: day_from_signup_to_paid
    type: tier
    tiers: [0,7,14,30,60,90]
    style: relational
    sql: |
      DAYS(${TABLE}.DT_JOINED) - DAYS(${TABLE}.DT_SIGNUP)

  - measure: count
    type: count
    drill_fields: []

