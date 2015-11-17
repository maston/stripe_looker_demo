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
        WHEN ${TABLE}.PLAN_TYPE=0 THEN 'A. Free Trial'
        WHEN ${TABLE}.PLAN_TYPE=1 THEN 'B. Bronze'
        WHEN ${TABLE}.PLAN_TYPE=2 THEN 'C. Silver'
        WHEN ${TABLE}.PLAN_TYPE=3 THEN 'D. Gold'
        ELSE 'N/A'
      END

  - dimension: user_id
    type: int
    sql: ${TABLE}.USER_ID
    primary_key: true
    hidden: true
  
  - dimension: conversion_to_paid_days
    type: tier
    tiers: [0,7,14,30,60,90]
    style: relational
    sql: |
      DAYS(${subscription_start_date}) - DAYS(${user_signups.signup_date})

  - measure: count
    type: count
    drill_fields: []

