# Go Template

## Technology Stack

| Tech      | Version |
| --------- | ------- |
| **Go**    | 1.26.0  |
| **GORM**  | 1.25.11 |
| **Atlas** | 1.1.0   |
| **MySQL** | 8.4.5   |

## Tools

This project uses the following tools:

**General tools:**

- [mise](https://mise.jdx.dev/): A tool for managing development environments and dependencies
- [lefthook](https://github.com/evilmartians/lefthook): A Git hooks manager
- [commitlint](https://commitlint.js.org/): A tool to lint commit messages
- [prettier](https://prettier.io/): A code formatter for other languages

**Go tools:**

- [golangci-lint](https://golangci-lint.run/): A Go linters aggregator
- [air](https://github.com/air-verse/air): A live reloading tool for Go applications
- [atlas](https://atlasgo.io/): A database schema management tool
- [GORM gen](https://gorm.io/gen/): A code generation tool for GORM

## Setup

To set up the Go template project, follow these steps:

```shell
mise install
mise install-tools
```

and then run:

```shell
go mod tidy
```

## Usage

### GORM gen

Generates data models from the tables registered in `scripts/gorm_gen/main.go`.

```shell
go run scripts/gorm_gen/main.go
```

### Atlas

Exports the database schema from the running MySQL container to `schema/`.

```shell
mise run atlas-inspect
```

Runs declarative migrations based on the DDL files located in `db/`.

```shell
mise run atlas-apply
```
