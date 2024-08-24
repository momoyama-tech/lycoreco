<script>
	function onclick() {
		window.location.href = '/rooms';
	}
	export let buttonText = 'ゲームスタート！';
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
	<button class="game-start-button">
		{buttonText}
	</button>
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

	.game-start-button {
		position: fixed;
		bottom: 150px; /* 画面の下から20pxの位置に固定 */
		left: 50%;
		transform: translateX(-50%);
		background-color: #f7b500;
		color: #2c2c2c;
		border: none;
		border-radius: 20px;
		padding: 20px 40px;
		font-size: 14px;
		cursor: pointer;
		text-align: center;
	}

	.game-start-button:hover {
		background-color: #e5a200;
	}
</style>
