<script>
	function onclick() {
		window.location.href = '/rooms';
	}
</script>

<main>
	<ion-header>
		<ion-button {onclick} size="small" class="back_button" fill="clear">←</ion-button>
		<h1 class="text_center">メンバーリスト</h1>
	</ion-header>
	<ion-card>
		<ion-card-header>
			<ion-card-title>メンバー１</ion-card-title>
		</ion-card-header>
	</ion-card>
	<ion-card>
		<ion-card-header>
			<ion-card-title>メンバー２</ion-card-title>
		</ion-card-header>
	</ion-card>
	<ion-card>
		<ion-card-header>
			<ion-card-title>メンバー３</ion-card-title>
		</ion-card-header>
	</ion-card>
	<ion-card>
		<ion-card-header>
			<ion-card-title>メンバー４</ion-card-title>
		</ion-card-header>
	</ion-card>
</main>

<style>
	.header {
		background-color: #ffffff;
	}

	.text_center {
		text-align: center;
	}
	.bottom_space {
		line-height: 30px;
	}

	.back_button {
		font-size: 25px;
	}
</style>
