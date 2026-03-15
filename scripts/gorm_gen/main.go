package main

import (
	"os"

	"github.com/tf63/go-template/pkg/config"
	"github.com/tf63/go-template/pkg/logger"
	"gorm.io/gen"
)

func main() {
	cfg, err := config.LoadConfig()
	if err != nil {
		logger.Log.Error("failed to load config: ", "err", err)
		os.Exit(1)
	}

	db, err := cfg.Database.ConnectDB()
	if err != nil {
		logger.Log.Error("failed to connect database: ", "err", err)
		os.Exit(1)
	}

	g := gen.NewGenerator(gen.Config{
		OutPath: "./internal/interface/mysql_gen/query", // 出力パス
		Mode:    gen.WithDefaultQuery | gen.WithQueryInterface,
		// if you want the nullable field generation property to be pointer type, set FieldNullable true
		FieldNullable: true,
		// if you want to assign field which has a default value in the `Create` API, set FieldCoverable true, reference: https://gorm.io/docs/create.html#Default-Values
		FieldCoverable: true,
		// if you want to generate field with unsigned integer type, set FieldSignable true
		FieldSignable: true,
		// if you want to generate index tags from database, set FieldWithIndexTag true
		FieldWithIndexTag: true,
		// if you want to generate type tags from database, set FieldWithTypeTag true
		FieldWithTypeTag: true,
		// if you need unit tests for query code, set WithUnitTest true
		WithUnitTest: true,
	})

	g.UseDB(db)

	// テーブル単位の生成
	// ApplyBasicするとqueryファイルが生成される
	g.ApplyBasic(
		g.GenerateModel("cats"),
		g.GenerateModel("dogs"),
	)

	// 全テーブルの生成
	// g.ApplyBasic(
	//   g.GenerateAllTable()
	// )

	g.Execute()
}
