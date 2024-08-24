<script>
	function onclick() {
		window.location.href = '/';
	}
	function goToRoom(roomId) {
		window.location.href = `/game/${roomId}`;
	}
	async function createRoom() {
		try {
			const response = await fetch('http://localhost:3000/rooms', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				}
			});

			if (response.ok) {
				const newRoom = await response.json();
				console.log('Room created:', newRoom.room_id);
				window.location.href = `/game/${newRoom.room_id}`;
			} else {
				console.error('Failed to create room:', response.statusText);
			}
		} catch (error) {
			console.error('Error creating room:', error);
		}
	}
	export let data;
</script>

<main>
	<ion-header>
		<ion-button {onclick} size="small" class="back_button" fill="clear">←</ion-button>
	</ion-header>
	<center>
		<h1>ルームリスト</h1>
	</center>
	<div class="room_list">
		{#if data.props.rooms.length > 0}
			{#each data.props.rooms as room}
				<ion-card on:click={() => goToRoom(room.id)}>
					<ion-card-header>
						<ion-card-title>ルーム{room.id}</ion-card-title>
					</ion-card-header>
				</ion-card>
			{/each}
		{:else}
			<p>No rooms available.</p>
		{/if}
	</div>
	<center>
		<ion-button shape="round" on:click={createRoom}>部屋作成</ion-button>
	</center>
</main>

<style>
	ion-button {
		height: 100px;
		width: 200px;
		font-size: 30px;
	}
	.room_list {
		overflow-y: auto;
		height: 60%;
	}
</style>
