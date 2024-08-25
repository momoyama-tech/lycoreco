<script>
	import { playerName } from '$lib/store.js';
	import { goto } from '$app/navigation';

	let name = '';

	function handleSubmit() {
		playerName.set(name);
		goto('/rooms');
	}
</script>

<main>
	<div class="logo">
		<img src="./supanyan.png" />
	</div>
	<p class="text">スパにゃんの<br />秘密のお友達</p>
	<p class="subtext">温泉インサイダー</p>
	<div class="name_input">
		<h1>名前を入力してください</h1>
		<input type="text" bind:value={name} placeholder="名前を入力" />
	</div>
	<div class="next">
		<ion-button shape="round" color="warning" on:click={() => handleSubmit()}>遊ぶ!</ion-button>
	</div>
</main>

<style>
	.logo {
		text-align: center;
	}
	.logo img {
		width: 80%;
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
	.name_input {
		margin-top: 30px;
		margin-bottom: 20px;
		text-align: center;
		font-size: 30px;
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
