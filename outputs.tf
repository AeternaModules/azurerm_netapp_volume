output "netapp_volumes_id" {
  description = "Map of id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "netapp_volumes_accept_grow_capacity_pool_for_short_term_clone_split" {
  description = "Map of accept_grow_capacity_pool_for_short_term_clone_split values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.accept_grow_capacity_pool_for_short_term_clone_split if v.accept_grow_capacity_pool_for_short_term_clone_split != null && length(v.accept_grow_capacity_pool_for_short_term_clone_split) > 0 }
}
output "netapp_volumes_account_name" {
  description = "Map of account_name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.account_name if v.account_name != null && length(v.account_name) > 0 }
}
output "netapp_volumes_azure_vmware_data_store_enabled" {
  description = "Map of azure_vmware_data_store_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.azure_vmware_data_store_enabled if v.azure_vmware_data_store_enabled != null }
}
output "netapp_volumes_cool_access" {
  description = "Map of cool_access values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.cool_access if v.cool_access != null && length(v.cool_access) > 0 }
}
output "netapp_volumes_create_from_snapshot_resource_id" {
  description = "Map of create_from_snapshot_resource_id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.create_from_snapshot_resource_id if v.create_from_snapshot_resource_id != null && length(v.create_from_snapshot_resource_id) > 0 }
}
output "netapp_volumes_data_protection_advanced_ransomware" {
  description = "Map of data_protection_advanced_ransomware values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_advanced_ransomware if v.data_protection_advanced_ransomware != null && length(v.data_protection_advanced_ransomware) > 0 }
}
output "netapp_volumes_data_protection_backup_policy" {
  description = "Map of data_protection_backup_policy values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_backup_policy if v.data_protection_backup_policy != null && length(v.data_protection_backup_policy) > 0 }
}
output "netapp_volumes_data_protection_replication" {
  description = "Map of data_protection_replication values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_replication if v.data_protection_replication != null && length(v.data_protection_replication) > 0 }
}
output "netapp_volumes_data_protection_snapshot_policy" {
  description = "Map of data_protection_snapshot_policy values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_snapshot_policy if v.data_protection_snapshot_policy != null && length(v.data_protection_snapshot_policy) > 0 }
}
output "netapp_volumes_encryption_key_source" {
  description = "Map of encryption_key_source values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.encryption_key_source if v.encryption_key_source != null && length(v.encryption_key_source) > 0 }
}
output "netapp_volumes_export_policy_rule" {
  description = "Map of export_policy_rule values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.export_policy_rule if v.export_policy_rule != null && length(v.export_policy_rule) > 0 }
}
output "netapp_volumes_kerberos_enabled" {
  description = "Map of kerberos_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.kerberos_enabled if v.kerberos_enabled != null }
}
output "netapp_volumes_key_vault_private_endpoint_id" {
  description = "Map of key_vault_private_endpoint_id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.key_vault_private_endpoint_id if v.key_vault_private_endpoint_id != null && length(v.key_vault_private_endpoint_id) > 0 }
}
output "netapp_volumes_large_volume_enabled" {
  description = "Map of large_volume_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.large_volume_enabled if v.large_volume_enabled != null }
}
output "netapp_volumes_location" {
  description = "Map of location values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.location if v.location != null && length(v.location) > 0 }
}
output "netapp_volumes_mount_ip_addresses" {
  description = "Map of mount_ip_addresses values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.mount_ip_addresses if v.mount_ip_addresses != null && length(v.mount_ip_addresses) > 0 }
}
output "netapp_volumes_name" {
  description = "Map of name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.name if v.name != null && length(v.name) > 0 }
}
output "netapp_volumes_network_features" {
  description = "Map of network_features values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.network_features if v.network_features != null && length(v.network_features) > 0 }
}
output "netapp_volumes_pool_name" {
  description = "Map of pool_name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.pool_name if v.pool_name != null && length(v.pool_name) > 0 }
}
output "netapp_volumes_protocols" {
  description = "Map of protocols values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.protocols if v.protocols != null && length(v.protocols) > 0 }
}
output "netapp_volumes_resource_group_name" {
  description = "Map of resource_group_name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "netapp_volumes_security_style" {
  description = "Map of security_style values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.security_style if v.security_style != null && length(v.security_style) > 0 }
}
output "netapp_volumes_service_level" {
  description = "Map of service_level values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.service_level if v.service_level != null && length(v.service_level) > 0 }
}
output "netapp_volumes_smb3_protocol_encryption_enabled" {
  description = "Map of smb3_protocol_encryption_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb3_protocol_encryption_enabled if v.smb3_protocol_encryption_enabled != null }
}
output "netapp_volumes_smb_access_based_enumeration_enabled" {
  description = "Map of smb_access_based_enumeration_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb_access_based_enumeration_enabled if v.smb_access_based_enumeration_enabled != null }
}
output "netapp_volumes_smb_continuous_availability_enabled" {
  description = "Map of smb_continuous_availability_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb_continuous_availability_enabled if v.smb_continuous_availability_enabled != null }
}
output "netapp_volumes_smb_non_browsable_enabled" {
  description = "Map of smb_non_browsable_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb_non_browsable_enabled if v.smb_non_browsable_enabled != null }
}
output "netapp_volumes_snapshot_directory_visible" {
  description = "Map of snapshot_directory_visible values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.snapshot_directory_visible if v.snapshot_directory_visible != null }
}
output "netapp_volumes_storage_quota_in_gb" {
  description = "Map of storage_quota_in_gb values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.storage_quota_in_gb if v.storage_quota_in_gb != null }
}
output "netapp_volumes_subnet_id" {
  description = "Map of subnet_id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.subnet_id if v.subnet_id != null && length(v.subnet_id) > 0 }
}
output "netapp_volumes_tags" {
  description = "Map of tags values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "netapp_volumes_throughput_in_mibps" {
  description = "Map of throughput_in_mibps values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.throughput_in_mibps if v.throughput_in_mibps != null }
}
output "netapp_volumes_volume_path" {
  description = "Map of volume_path values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.volume_path if v.volume_path != null && length(v.volume_path) > 0 }
}
output "netapp_volumes_zone" {
  description = "Map of zone values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.zone if v.zone != null && length(v.zone) > 0 }
}

