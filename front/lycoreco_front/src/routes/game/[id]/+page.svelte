<script>
	import { onMount } from 'svelte';
	import { createConsumer } from '@rails/actioncable';

	let messages = [];
	let subscription = null;
	onMount(() => {
		const consumer = createConsumer('ws://localhost:3000/cable'); // WebSocketのURLを指定

		subscription = consumer.subscriptions.create(
			{ channel: 'RoomChannel' }, // 接続するチャネルを指定
			{
				connected() {
					console.log('Connected to the channel');
				},

				disconnected() {
					console.log('Disconnected from the channel');
				},

				received(data) {
					// メッセージを受信したときの処理
					messages = [...messages, data.message];
				},

				sendMessage(content) {
					// メッセージを送信するためのメソッド
					this.perform('game', { content });
				}
			}
		);

		return () => {
			subscription.unsubscribe();
		};
	});

	let newMessage = '';

	function sendMessage() {
		subscription.sendMessage(newMessage);
		newMessage = '';
	}

	export let data;
</script>

<main>
	game
	<h1>Dashboard for ID: {data.params.id}</h1>
	<ul>
		{#each messages as message}
			<li>{message}</li>
		{/each}
	</ul>

	<input bind:value={newMessage} placeholder="Type a message..." />
	<button on:click={sendMessage}>Send</button>
</main>

<style></style>
