data "oci_capacity_management_internal_occm_demand_signal_catalog_resources" "capacity_management_internal_occm_demand_signal_catalog_resources_lookup" {
  for_each = var.capacity_management_internal_occm_demand_signal_catalog_resources_lookup

  compartment_id                = each.value.compartment_id
  occ_customer_group_id         = each.value.occ_customer_group_id
  occm_demand_signal_catalog_id = each.value.occm_demand_signal_catalog_id
  demand_signal_namespace       = each.value.demand_signal_namespace
  name                          = each.value.name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

