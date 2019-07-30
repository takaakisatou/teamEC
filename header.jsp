<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

  <meta charset="UTF-8" />

<header>
  <div id="headerLogo">
	<h5>Panther</h5>
  </div>
	<s:form action="SearchItemAction">

		<s:if
			test="#session.mCategoryList!=null && #session.mCategoryList.size()>0">
			<s:select name="categoryId" list="#session.mCategoryList"
				listValue="categoryName" listKey="categoryId" class="categoryId" />
		</s:if>
		<s:textfield name="keywords" placeholder="検索ワード" class="keywords" />
		<s:submit value="商品検索" class="submit_btn" />

		<s:if test="#session.logined==0">
			<a class="submit_anc01" href='<s:url action="GoLoginAction" />'>ログイン</a>
		</s:if>

		<s:else>
			<a class="submit_anc01" href='<s:url action="LogoutAction" />'>ログアウト</a>
		</s:else>

		<a class="submit_anc01" href='<s:url action="CartAction" />'>カート</a>

		<a class="submit_anc01" href='<s:url action="ProductListAction" />'>商品一覧</a>

		<s:if test="#session.logined==1">
			<a class="submit_anc01" href='<s:url action="MyPageAction" />'>マイページ</a>
		</s:if>

	</s:form>

</header>
