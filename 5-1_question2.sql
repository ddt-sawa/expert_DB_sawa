/*5-1 問2 支社/支店別の取り扱い商品の一覧。結果には支社名・支店名・商品名を含むものとする。
（PostgreSQLを使用します)*/

--取得列
SELECT

	--支社名
	BranchCompany.BRANCH_COMPANY_NAME,
	
	--支店名
	BranchShop.BRANCH_NAME,
	
	--商品名
	Product.PRODUCT_NAME

--参照範囲
FROM

	--支社テーブルと支店テーブルを結合する
	( 
		--それらと支店商品テーブルを結合する
		(
			--それらと商品テーブルを結合する
			(
				--支社テーブル
				BranchCompany
	
			--NULL値を考慮しないので内部結合
			INNER JOIN
	
				--支店テーブル
				BranchShop
	
			--結合列
			ON
	
				--支社コード列
				BranchCompany.BRANCH_COMPANY_ID = BranchShop.BRANCH_COMPANY_ID
		
			--支社テーブルと支社テーブル結合完了、次は支店商品テーブルを結合
			)
			
	--NULL値を考慮しないので内部結合
	INNER JOIN
	
		--支店商品テーブル
		CompanyShopProduct
		
	--結合列
	ON
	
		--支社コード列
		CompanyShopProduct.BRANCH_COMPANY_ID = BranchCompany.BRANCH_COMPANY_ID
		
	--と	
	AND
		
		--支店コード列
		CompanyShopProduct.BRANCH_SHOP_ID = BranchShop.BRANCH_SHOP_ID
		
		--支店商品テーブル結合終了、次は商品テーブルを結合
		)
		
	--NULL値を考慮しないので内部結合
	INNER JOIN
	
		--商品テーブル
		Product
		
	--結合列
	ON
	
		--商品コード列
		CompanyShopProduct.PRODUCT_ID = Product.PRODUCT_ID
	)
;
