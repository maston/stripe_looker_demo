- view: user_signups
  sql_table_name: USER_SIGNUPS
  fields:

  - dimension_group: signup
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_SIGNUP

  - dimension: user_age_group
    type: int
    sql: ${TABLE}.USER_AGE_GROUP

  - dimension: user_gender
    type: int
    sql: ${TABLE}.USER_GENDER

#   - dimension: user_id
#     type: int
#     sql: ${TABLE}.USER_ID

  - dimension: user_state
    sql: ${TABLE}.USER_STATE

  - measure: count
    type: count
    drill_fields: []

