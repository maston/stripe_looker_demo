- connection: maston_dashdb

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: stripe_pmts

# - explore: ibm_sequence_number

# - explore: sf_account

# - explore: sf_account_overflow

# - explore: st_account

# - explore: st_account_currencies_supported

# - explore: st_account_overflow

# - explore: st_application_fee_overflow

# - explore: st_balance_transaction

# - explore: st_balance_transaction_fee_details

# - explore: st_balance_transaction_overflow

# - explore: st_bank_account_overflow

# - explore: st_bitcoin_receiver_overflow

# - explore: st_charge

# - explore: st_charge_overflow

# - explore: st_coupon_overflow

# - explore: st_customer

# - explore: st_customer_overflow

# - explore: st_customer_sources_data

# - explore: st_customer_subscriptions_data

# - explore: st_dispute_overflow

# - explore: st_event

# - explore: st_event_data_object_available

# - explore: st_event_data_object_lines_data

# - explore: st_event_data_object_pending

# - explore: st_event_data_object_sources_data

# - explore: st_event_data_object_subscriptions_data

# - explore: st_event_overflow

# - explore: st_invoice

# - explore: st_invoice_lines_data

# - explore: st_invoice_overflow

# - explore: st_invoiceitem_overflow

# - explore: st_plan

# - explore: st_plan_overflow

# - explore: st_recipient_overflow

# - explore: st_refund_overflow

# - explore: st_transfer_overflow

# - explore: test_pmts

# - explore: user_signups

# - explore: user_subscriptions

