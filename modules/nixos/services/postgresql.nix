{ lib
, pkgs
, config
, ...
}:
let
  inherit (lib) mkIf;

  cfg = config.modules.services;
in
{
  config = mkIf cfg.postgresql.enable {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_16;

      ensureDatabases = [
        "stardust"
      ];

      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
        # ipv4
        host  all      all     127.0.0.1/32   trust
        # ipv6
        host all       all     ::1/128        trust
      '';

      initialScript = pkgs.writeText "backend-initScript" ''
        CREATE ROLE dbuser WITH LOGIN PASSWORD '1234' CREATEDB;
        CREATE DATABASE dbuser;
        GRANT ALL PRIVILEGES ON DATABASE postgres TO dbuser;
      '';

      checkConfig = true;
      enableTCPIP = false;

      # http://pgconfigurator.cybertec.at/;
      # https://git.darmstadt.ccc.de/maralorn/nixos-config/-/blob/master/nixos/roles/matrix-synapse/postgres-tuning.nix
      settings = {
        # Connectivity;
        max_connections = 100;
        superuser_reserved_connections = 3;

        # Replication;
        wal_level = "replica"; # consider using at least "replica";
        max_wal_senders = 0;
        synchronous_commit = "on";

        # log slow queries
        log_min_duration_statement = 100;
        "auto_explain.log_min_duration" = 100;

        # logging configuration
        log_connections = true;
        log_statement = "all";
        logging_collector = true;
        log_disconnections = true;
        log_destination = lib.mkForce "syslog";
      };
    };
  };
}
