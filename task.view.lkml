view: task {
  dimension: is_search_source {
    type: yesno
    sql: ${users.traffic_source}="Search" ;;
  }

  measure: sales_from_complete_search_users {
    type: sum
    sql: ${TABLE}.sale_price ;;
    filters: [is_search_source: "Yes", order_items.status: "Complete"]
  }
  measure: total_gross_margin {
    type: sum
    sql: ${TABLE}.sale_price-${inventory_items.cost} ;;
  }

  dimension: return_days {
    type: number
    sql: DATE_DIFF(${order_items.delivered_date},${order_items.returned_date},DAY) ;;
  }
}
