<script>
	export let messages = [];
</script>

<div class="chat-container">
	<div class="chat-header">
		<h2>ディスカッション！</h2>
	</div>

	<div class="chat-content">
		{#each messages as message}
			<div class="message-row {message.isMine ? 'sent' : 'received'}">
				{#if !message.isMine}
					<img src={message.avatar} alt="User Avatar" class="avatar" />
				{/if}
				<div class="message-bubble">
					{#if message.date}
						<div class="message-date">{message.date}</div>
					{/if}
					<div class="message-text">{message.text}</div>
				</div>
				{#if message.isMine}
					<img src={message.avatar} alt="User Avatar" class="avatar" />
				{/if}
			</div>
			<div class="message-time">{message.time}</div>
		{/each}
	</div>

	<div class="chat-input">
		<input type="text" placeholder="Write something..." />
		<button class="send-button">Send</button>
	</div>
</div>

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

	.message-bubble .message-text {
		margin: 0;
	}

	.message-bubble .message-date {
		font-size: 12px;
		color: #999;
		text-align: center;
		margin-bottom: 5px;
	}

	.message-row.sent .message-bubble {
		background-color: #ffe585;
	}

	.message-time {
		font-size: 12px;
		color: #999;
		text-align: center;
	}

	.chat-input {
		display: flex;
		padding: 10px;
		border-top: 1px solid #ddd;
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
