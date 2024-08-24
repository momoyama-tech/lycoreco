<script>
	function onclick() {
		window.location.href = '/';
	}
	function goToRoom(roomId) {
		window.location.href = `/game/${roomId}`;
	}
	export let data;
	console.log(data.props.rooms);
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
						<ion-card-title>ルーム{room.name}</ion-card-title>
					</ion-card-header>
				</ion-card>
			{/each}
		{:else}
			<p>No rooms available.</p>
		{/if}
	</div>
	<center>
		<ion-button shape="round"> ＋ </ion-button>
	</center>
</main>

<style>
	ion-botton {
		text-align: center;
		position: absolute;
	}
	.room_list {
		overflow-y: auto;
		height: 60%;
	}
</style>
