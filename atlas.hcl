env "local" {
  src = "file://db"
  url = "mysql://root:rootpassword@localhost:3306/example"
  dev = "docker://mysql/8/dev"

  format {
    schema {
      inspect = "{{ sql . | split | write \"schema\" }}"
    }
  }
}

exporter "sql" "schema_dir" {
  path     = "schema/sql"
  split_by = object
  naming   = lower
}
