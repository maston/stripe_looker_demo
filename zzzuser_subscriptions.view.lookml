- view: user_subscriptions
  sql_table_name: USER_SUBSCRIPTIONS
  fields:

  - dimension: dt_cancelled
    sql: ${TABLE}.DT_CANCELLED

  - dimension_group: dt_joined
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.DT_JOINED

  - dimension: plan_type
    type: int
    sql: ${TABLE}.PLAN_TYPE

#   - dimension: user_id
#     type: int
#     sql: ${TABLE}.USER_ID

  - measure: count
    type: count
    drill_fields: []

