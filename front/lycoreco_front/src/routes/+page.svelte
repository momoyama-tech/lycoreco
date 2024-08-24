<script>
	function goToRooms() {
		window.location.href = `/rooms`;
	}
</script>

<main>
	<div class="logo">
		<img src="./supanyan.png" />
	</div>
	<p class="text">スパにゃんの<br />秘密のお友達</p>
	<p class="subtext">温泉インサイダー</p>
	<div class="next">
		<ion-button shape="round" color="warning" on:click={() => goToRooms()}>遊ぶ!</ion-button>
	</div>
</main>

<style>
	.logo {
		text-align: center;
		margin-top: 30%;
	}
	.logo img {
		height: 400px;
	}
	.text {
		margin-top: -50px;
		display: block;
		text-align: center;
		font-size: 50px;
		line-height: 50px;
		font-weight: bold;
	}
	.subtext {
		margin-top: -40px;
		display: block;
		text-align: center;
		font-weight: bold;
	}
	.next {
		text-align: center;
	}
	ion-button {
		height: 100px;
		width: 200px;
		font-size: 40px;
	}
</style>
