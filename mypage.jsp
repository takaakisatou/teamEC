<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <link rel="stylesheet" href="./css/mypage.css" >
  <link rel="stylesheet" href="./css/panther.css">
  <link rel="stylesheet" href="./css/cssreset.css" >
  <link rel="stylesheet" href="./css/header.css">
  <title>マイページ画面</title>

</head>

<body>

	<jsp:include page="header.jsp" />

	<div class="main">

		<h1>マイページ画面</h1>

		<s:if test="userInfoDTO==null">
			<h3>ユーザー情報がありません。</h3>
		</s:if>

		<s:elseif test="userInfoDTO!=null">
			<s:form>
				<table>
					<tr>
						<th>姓</th>
						<td><s:property value="userInfoDTO.familyName" /></td>
					</tr>

					<tr>
						<th>名</th>
						<td><s:property value="userInfoDTO.firstName" /></td>
					</tr>

					<tr>
						<th>ふりがな</th>
						<td><s:property value="userInfoDTO.familyNameKana" /><span>　
						</span>
						<s:property value="userInfoDTO.firstNameKana" /></td>
					</tr>

					<tr>
						<th>性別</th>
						<td><s:if test="userInfoDTO.sex == 0">
					男性
					</s:if> <s:else>
					女性
					</s:else></td>
					</tr>

					<tr>
						<th>メールアドレス</th>
						<td><s:property value="userInfoDTO.email" /></td>
					</tr>

				</table>

			</s:form>

			<div class="button">
					<a class="submit_anc01" href='<s:url action="PurchaseHistoryAction"/>'>購入履歴</a>
			</div>

		</s:elseif>

	</div>

</body>
</html>