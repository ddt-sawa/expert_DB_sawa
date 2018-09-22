/*5-1 問3 最も取り扱い商品数が多い支店の支店コードと商品数。
（PostgreSQLを使用します)*/

--取得列
SELECT

	--支社コード
	CompanyShopProduct.BRANCH_COMPANY_ID,
	
	--支店コード
	CompanyShopProduct.BRANCH_SHOP_ID,
	
	--商品数
	COUNT(Product.PRODUCT_ID) AS 最大商品数
	

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

--支店ごとにグループ化
GROUP BY

	--支社コード
	CompanyShopProduct.BRANCH_COMPANY_ID,
	
	--支店コード
	CompanyShopProduct.BRANCH_SHOP_ID
	
--グループ化後に課す取得条件
HAVING 

	--商品数が最大
	COUNT(Product.PRODUCT_ID) = 
	
	--最大商品数を求めるサブクエリ
	(
		--取得値
		SELECT
		
			--最大商品数
			MAX (商品数)
		
		--参照範囲
		FROM
		
		--最大商品数を求めるための参照範囲を求めるサブクエリ
		(
		
		--取得列
		SELECT
	
			--支社コード
			CompanyShopProduct.BRANCH_COMPANY_ID,
			
			--支店コード
			CompanyShopProduct.BRANCH_SHOP_ID,
			
			--商品数
			COUNT(Product.PRODUCT_ID) AS 商品数
	
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
	
		--支店ごとにグループ化
		GROUP BY
	
			--支社コード
			CompanyShopProduct.BRANCH_COMPANY_ID,
		
			--支店コード
			CompanyShopProduct.BRANCH_SHOP_ID
			
		--最大商品数を求めるための参照範囲を求めるサブクエリ終了
		) AS SubQuery

	--最大商品数を求めるサブクエリ終了
	)
;
