/*5-1 問1 商品分類ごとの商品数。結果には分類名を含むものとする。
（PostgreSQLを使用します)*/


--商品分類ごとの商品数を把握するため、商品分類コードとその分類名、商品分類コードに関連する商品コードの列数を取得する
SELECT

	--商品分類
	ProductClassification.PRODUCT_CLASSIFICATION_ID, 

	--商品分類名
	ProductClassification.PRODUCT_CLASSIFICATION_NAME,
	
	--商品分類ごとの商品数
	Count(Product.PRODUCT_ID)

--参照範囲
FROM

	--商品分類テーブル
	ProductClassification
	
--商品分類コードと商品コードの関連が載っている商品テーブルについて、NULL値を考慮しないので内部結合
INNER JOIN

	--商品テーブル
	Product
	
--結合列
ON
	--両テーブルにおける商品分類コード
	 ProductClassification.PRODUCT_CLASSIFICATION_ID = Product.PRODUCT_CLASSIFICATION_ID
	 
	 
--グループ化のキー値
GROUP BY

	--商品分類コード
	ProductClassification.PRODUCT_CLASSIFICATION_ID,
	
	--商品分類名
	ProductClassification.PRODUCT_CLASSIFICATION_NAME
;
