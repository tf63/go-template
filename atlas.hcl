variable "db_host" {
  type    = string
  default = getenv("DB_HOST")
}

variable "db_port" {
  type    = string
  default = getenv("DB_PORT")
}

variable "db_user" {
  type    = string
  default = getenv("DB_USER")
}

variable "db_password" {
  type    = string
  default = getenv("DB_PASSWORD")
}

variable "db_name" {
  type    = string
  default = getenv("DB_NAME")
}

env "local" {
  src = "file://db"
  url = "mysql://${var.db_user}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}"
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
