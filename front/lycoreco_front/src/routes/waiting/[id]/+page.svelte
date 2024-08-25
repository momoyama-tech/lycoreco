<script>
	import { onMount } from 'svelte';
	import { playerName } from '$lib/store.js';
	import { createConsumer } from '@rails/actioncable';
	import { env } from '$env/dynamic/public';
	import { page } from '$app/stores';
	let subscription = null;
	let players = [];
	onMount(() => {
		const consumer = createConsumer(`${env.PUBLIC_BASE_WS}/cable`); // WebSocketのURLを指定

		subscription = consumer.subscriptions.create(
			{ channel: 'RoomChannel' }, // 接続するチャネルを指定
			{
				connected() {
					console.log('Connected to the channel');
					let name = '';
					playerName.subscribe((value) => {
						name = value;
					});
					this.sendJoinMessage({
						name: name,
						room_id: $page.params.id
					});
				},

				disconnected() {
					console.log('Disconnected from the channel');
				},

				received(data) {
					console.log('Received data:', data);
					console.log('aaaa: ', players);
					players = [...players, data['join_player']];
					console.log('aaaa: ', players);
				},

				sendMessage(content) {
					this.perform('wait', { content });
				},

				sendJoinMessage(content) {
					this.perform('join', { content });
				}
			}
		);

		return () => {
			subscription.unsubscribe();
		};
	});
	function goToGame() {
		goto(`/game/${$page.params.id}`);
	}
</script>

<main>
	<ion-header>
		<h1 class="text_center">メンバーリスト</h1>
	</ion-header>
	{#each players as player}
		<ion-card>
			<ion-card-header>
				<ion-card-title>{player}</ion-card-title>
			</ion-card-header>
		</ion-card>
	{/each}
	<button class="game-start-button" on:click={() => goToGame(room.id)}>スタート！</button>
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
		padding: 10px;
		font-size: 30px;
		cursor: pointer;
		text-align: center;
	}

	.game-start-button:hover {
		background-color: #e5a200;
	}
</style>
