# profile to deploy a puppet vault_message

class profile::vault_message {

  $vault_lookup = {
    'vault' => Deferred('vault_lookup::lookup',
                    ["kv/data/test", 'https://vault.vm:8200']),
  }

  notify { 'Secret from Vault':
    message => Deferred('inline_epp',
               ['<%= $vault.unwrap %>', $vault_lookup]),
  }

}
