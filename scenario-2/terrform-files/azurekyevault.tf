data "azurerm_key_vault_secret" "vmpd1" {
  name      = "secret-admin1"
  vault_uri = "https://vmpd1.vault.azure.net/"
}

output "secret_value" {
  value = "${data.azurerm_key_vault_secret.vmpd1.value}"
}

data "azurerm_key_vault_secret" "vmpd2" {
  name      = "secret-admin2"
  vault_uri = "https://vmpd2.vault.azure.net/"
}

output "secret_value" {
  value = "${data.azurerm_key_vault_secret.vmpd2.value}"
}
