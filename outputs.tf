output "netapp_volumes_id" {
  description = "Map of id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.id }
}
output "netapp_volumes_accept_grow_capacity_pool_for_short_term_clone_split" {
  description = "Map of accept_grow_capacity_pool_for_short_term_clone_split values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.accept_grow_capacity_pool_for_short_term_clone_split }
}
output "netapp_volumes_account_name" {
  description = "Map of account_name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.account_name }
}
output "netapp_volumes_azure_vmware_data_store_enabled" {
  description = "Map of azure_vmware_data_store_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.azure_vmware_data_store_enabled }
}
output "netapp_volumes_cool_access" {
  description = "Map of cool_access values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.cool_access }
}
output "netapp_volumes_create_from_snapshot_resource_id" {
  description = "Map of create_from_snapshot_resource_id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.create_from_snapshot_resource_id }
}
output "netapp_volumes_data_protection_advanced_ransomware" {
  description = "Map of data_protection_advanced_ransomware values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_advanced_ransomware }
}
output "netapp_volumes_data_protection_backup_policy" {
  description = "Map of data_protection_backup_policy values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_backup_policy }
}
output "netapp_volumes_data_protection_replication" {
  description = "Map of data_protection_replication values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_replication }
}
output "netapp_volumes_data_protection_snapshot_policy" {
  description = "Map of data_protection_snapshot_policy values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.data_protection_snapshot_policy }
}
output "netapp_volumes_encryption_key_source" {
  description = "Map of encryption_key_source values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.encryption_key_source }
}
output "netapp_volumes_export_policy_rule" {
  description = "Map of export_policy_rule values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.export_policy_rule }
}
output "netapp_volumes_kerberos_enabled" {
  description = "Map of kerberos_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.kerberos_enabled }
}
output "netapp_volumes_key_vault_private_endpoint_id" {
  description = "Map of key_vault_private_endpoint_id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.key_vault_private_endpoint_id }
}
output "netapp_volumes_large_volume_enabled" {
  description = "Map of large_volume_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.large_volume_enabled }
}
output "netapp_volumes_location" {
  description = "Map of location values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.location }
}
output "netapp_volumes_mount_ip_addresses" {
  description = "Map of mount_ip_addresses values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.mount_ip_addresses }
}
output "netapp_volumes_name" {
  description = "Map of name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.name }
}
output "netapp_volumes_network_features" {
  description = "Map of network_features values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.network_features }
}
output "netapp_volumes_pool_name" {
  description = "Map of pool_name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.pool_name }
}
output "netapp_volumes_protocols" {
  description = "Map of protocols values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.protocols }
}
output "netapp_volumes_resource_group_name" {
  description = "Map of resource_group_name values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.resource_group_name }
}
output "netapp_volumes_security_style" {
  description = "Map of security_style values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.security_style }
}
output "netapp_volumes_service_level" {
  description = "Map of service_level values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.service_level }
}
output "netapp_volumes_smb3_protocol_encryption_enabled" {
  description = "Map of smb3_protocol_encryption_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb3_protocol_encryption_enabled }
}
output "netapp_volumes_smb_access_based_enumeration_enabled" {
  description = "Map of smb_access_based_enumeration_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb_access_based_enumeration_enabled }
}
output "netapp_volumes_smb_continuous_availability_enabled" {
  description = "Map of smb_continuous_availability_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb_continuous_availability_enabled }
}
output "netapp_volumes_smb_non_browsable_enabled" {
  description = "Map of smb_non_browsable_enabled values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.smb_non_browsable_enabled }
}
output "netapp_volumes_snapshot_directory_visible" {
  description = "Map of snapshot_directory_visible values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.snapshot_directory_visible }
}
output "netapp_volumes_storage_quota_in_gb" {
  description = "Map of storage_quota_in_gb values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.storage_quota_in_gb }
}
output "netapp_volumes_subnet_id" {
  description = "Map of subnet_id values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.subnet_id }
}
output "netapp_volumes_tags" {
  description = "Map of tags values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.tags }
}
output "netapp_volumes_throughput_in_mibps" {
  description = "Map of throughput_in_mibps values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.throughput_in_mibps }
}
output "netapp_volumes_volume_path" {
  description = "Map of volume_path values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.volume_path }
}
output "netapp_volumes_zone" {
  description = "Map of zone values across all netapp_volumes, keyed the same as var.netapp_volumes"
  value       = { for k, v in azurerm_netapp_volume.netapp_volumes : k => v.zone }
}

