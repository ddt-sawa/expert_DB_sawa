/*5-2 問3の非正規化によるSQLチューニング。
（PostgreSQLを使用します)*/

--チューニング方法:支店テーブルに商品数(PRODUCT_NUMBER)列を追加する
--以下、チューニングを行った際のSQL文

--取得列
SELECT

	--支社コード
	BranchShop.BRANCH_COMPANY_ID,
	
	--支店コード
	BranchShop.BRANCH_SHOP_ID,
	
	--商品数
	BranchShop.PRODUCT_NUMBER
	
--参照範囲
FROM

	--支店テーブル
	BranchShop
	
--取得条件
WHERE

 	--商品数が最大
	PRODUCT_NUMBER = 
	
	--最大商品数を求めるサブクエリ
	(
	
	--取得値
	SELECT 
	
		--最大商品数
		MAX(BranchShop.PRODUCT_NUMBER)
		
	--参照範囲
	FROM

		--支店テーブル
		BranchShop
	)
;
