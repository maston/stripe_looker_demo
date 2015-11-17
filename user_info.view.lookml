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
            FROM USER_SIGNUPS U, USER_SUBSCRIPTIONS S 
            WHERE U.USER_ID = S.USER_ID

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
    type: int
    sql: ${TABLE}.USER_GENDER

  - dimension: user_age_group
    type: int
    sql: ${TABLE}.USER_AGE_GROUP

  - dimension: user_state
    type: string
    sql: ${TABLE}.USER_STATE

  - dimension: subscription_start
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_JOINED

  - dimension: plan_type
    type: int
    sql: ${TABLE}.PLAN_TYPE

  - dimension: subscription_cancelled
    type: string
    sql: ${TABLE}.DT_CANCELLED

#   - dimension: conversion_tier
#     type: tier
#     sql: days (current date) - days (date('1999-10-22'))
    
  - measure: count
    type: count
    drill_fields: detail*
