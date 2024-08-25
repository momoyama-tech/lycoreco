<script>
	import { onMount, afterUpdate } from 'svelte';
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
					console.log('Received data:', data);
					// メッセージを受信したときの処理
					messages = [...messages, { text: data.message, isMine: false }];
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

	afterUpdate(() => {
		const chatContent = document.querySelector('.chat-content');
		if (chatContent) {
			chatContent.scrollTop = chatContent.scrollHeight;
		}
	});

	let newMessage = '';

	function sendMessage() {
		const message = {
			text: newMessage,
			isMine: true
		};

		messages = [...messages, message];
		subscription.sendMessage(newMessage);
		newMessage = '';
	}

	function handleKeyPress(event) {
		if (event.key === 'Enter') {
			sendMessage();
		}
	}

	export let data;
</script>

<main>
	<div class="chat-container">
		<div class="chat-header">
			<h1>ルーム{data.params.id}</h1>
		</div>
		<ul class="chat-content">
			{#each messages as message}
				<div class="message-row {message.isMine ? 'sent' : 'received'}">
					{#if !message.isMine}
						<img src="/spaicon.png" alt="" class="avatar" />
					{/if}
					<div class="message-bubble">
						<div class="message-text">{message.text}</div>
					</div>
				</div>
			{/each}
		</ul>
		<div class="chat-input">
			<input bind:value={newMessage} placeholder="Type a message..." on:keydown={handleKeyPress} />
			<button class="send-button" on:click={sendMessage}>Send</button>
		</div>
	</div>
</main>

<style>
	.chat-container {
		display: flex;
		flex-direction: column;
		height: 100vh;
		background-color: #fff;
		font-family: Arial, sans-serif;
	}

	.chat-header {
		padding: 10px;
		border-bottom: 1px solid #ddd;
		text-align: center;
	}

	.chat-content {
		flex: 1;
		overflow-y: auto;
		padding: 10px;
		margin-bottom: 60px; /* 入力フォームのためのスペースを確保 */
	}

	.message-row {
		display: flex;
		align-items: flex-end;
		margin-bottom: 10px;
	}

	.message-row.sent {
		justify-content: flex-end;
	}

	.message-row.received {
		justify-content: flex-start;
	}

	.avatar {
		width: 40px;
		height: 40px;
		border-radius: 50%;
		margin: 0 10px;
	}

	.message-bubble {
		max-width: 60%;
		padding: 10px;
		border-radius: 10px;
		background-color: #f0f0f0;
	}

	.message-row.sent .message-bubble {
		background-color: #ffe585;
	}

	.chat-input {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
		display: flex;
		padding: 10px;
		border-top: 1px solid #ddd;
		background-color: #fff;
		align-items: center;
	}

	.chat-input input {
		flex: 1;
		padding: 10px;
		border-radius: 20px;
		border: 1px solid #ddd;
		margin-right: 10px;
	}

	.send-button {
		background-color: #4caf50;
		color: white;
		padding: 10px;
		border: none;
		border-radius: 20px;
		cursor: pointer;
	}

	.send-button:hover {
		background-color: #45a049;
	}
</style>
