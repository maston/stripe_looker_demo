- view: user_signups
  sql_table_name: USER_SIGNUPS
  fields:

  - dimension_group: signup
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.DT_SIGNUP

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

  - dimension: user_gender
    type: string
    sql: |
      CASE 
        WHEN ${TABLE}.USER_GENDER=0 THEN 'Male'
        WHEN ${TABLE}.USER_GENDER=1 THEN 'Female'
        ELSE 'N/A'
      END

  - dimension: user_id
    type: int
    sql: ${TABLE}.USER_ID
    primary_key: true

  - dimension: user_state
    sql: ${TABLE}.USER_STATE

  - measure: count
    type: count
    drill_fields: []

