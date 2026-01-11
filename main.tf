resource "azurerm_netapp_volume" "netapp_volumes" {
  for_each = var.netapp_volumes

  account_name                                         = each.value.account_name
  subnet_id                                            = each.value.subnet_id
  storage_quota_in_gb                                  = each.value.storage_quota_in_gb
  service_level                                        = each.value.service_level
  volume_path                                          = each.value.volume_path
  pool_name                                            = each.value.pool_name
  name                                                 = each.value.name
  location                                             = each.value.location
  resource_group_name                                  = each.value.resource_group_name
  security_style                                       = each.value.security_style
  tags                                                 = each.value.tags
  snapshot_directory_visible                           = each.value.snapshot_directory_visible
  smb_non_browsable_enabled                            = each.value.smb_non_browsable_enabled
  smb_continuous_availability_enabled                  = each.value.smb_continuous_availability_enabled
  smb_access_based_enumeration_enabled                 = each.value.smb_access_based_enumeration_enabled
  smb3_protocol_encryption_enabled                     = each.value.smb3_protocol_encryption_enabled
  protocols                                            = each.value.protocols
  kerberos_enabled                                     = each.value.kerberos_enabled
  large_volume_enabled                                 = each.value.large_volume_enabled
  key_vault_private_endpoint_id                        = each.value.key_vault_private_endpoint_id
  throughput_in_mibps                                  = each.value.throughput_in_mibps
  encryption_key_source                                = each.value.encryption_key_source
  create_from_snapshot_resource_id                     = each.value.create_from_snapshot_resource_id
  azure_vmware_data_store_enabled                      = each.value.azure_vmware_data_store_enabled
  accept_grow_capacity_pool_for_short_term_clone_split = each.value.accept_grow_capacity_pool_for_short_term_clone_split
  network_features                                     = each.value.network_features
  zone                                                 = each.value.zone

  dynamic "cool_access" {
    for_each = each.value.cool_access != null ? [each.value.cool_access] : []
    content {
      coolness_period_in_days = cool_access.value.coolness_period_in_days
      retrieval_policy        = cool_access.value.retrieval_policy
      tiering_policy          = cool_access.value.tiering_policy
    }
  }

  dynamic "data_protection_backup_policy" {
    for_each = each.value.data_protection_backup_policy != null ? [each.value.data_protection_backup_policy] : []
    content {
      backup_policy_id = data_protection_backup_policy.value.backup_policy_id
      backup_vault_id  = data_protection_backup_policy.value.backup_vault_id
      policy_enabled   = data_protection_backup_policy.value.policy_enabled
    }
  }

  dynamic "data_protection_replication" {
    for_each = each.value.data_protection_replication != null ? [each.value.data_protection_replication] : []
    content {
      endpoint_type             = data_protection_replication.value.endpoint_type
      remote_volume_location    = data_protection_replication.value.remote_volume_location
      remote_volume_resource_id = data_protection_replication.value.remote_volume_resource_id
      replication_frequency     = data_protection_replication.value.replication_frequency
    }
  }

  dynamic "data_protection_snapshot_policy" {
    for_each = each.value.data_protection_snapshot_policy != null ? [each.value.data_protection_snapshot_policy] : []
    content {
      snapshot_policy_id = data_protection_snapshot_policy.value.snapshot_policy_id
    }
  }

  dynamic "export_policy_rule" {
    for_each = each.value.export_policy_rule != null ? each.value.export_policy_rule : []
    content {
      allowed_clients                = export_policy_rule.value.allowed_clients
      kerberos_5_read_only_enabled   = export_policy_rule.value.kerberos_5_read_only_enabled
      kerberos_5_read_write_enabled  = export_policy_rule.value.kerberos_5_read_write_enabled
      kerberos_5i_read_only_enabled  = export_policy_rule.value.kerberos_5i_read_only_enabled
      kerberos_5i_read_write_enabled = export_policy_rule.value.kerberos_5i_read_write_enabled
      kerberos_5p_read_only_enabled  = export_policy_rule.value.kerberos_5p_read_only_enabled
      kerberos_5p_read_write_enabled = export_policy_rule.value.kerberos_5p_read_write_enabled
      protocol                       = export_policy_rule.value.protocol
      protocols_enabled              = export_policy_rule.value.protocols_enabled
      root_access_enabled            = export_policy_rule.value.root_access_enabled
      rule_index                     = export_policy_rule.value.rule_index
      unix_read_only                 = export_policy_rule.value.unix_read_only
      unix_read_write                = export_policy_rule.value.unix_read_write
    }
  }
}

