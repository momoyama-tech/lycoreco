<script>
	import { playerName } from '$lib/store.js';
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { env } from '$env/dynamic/public';

	let name = '';

	onMount(() => {
		playerName.subscribe((value) => {
			name = value;
		});
	});
	function goToRoom(roomId) {
		goto(`/waiting/${roomId}`);
	}
	async function createRoom() {
		try {
			const response = await fetch(`${env.PUBLIC_BASE_URL}/rooms`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				}
			});

			if (response.ok) {
				const newRoom = await response.json();
				console.log('Room created:', newRoom.room_id);
				goto(`/waiting/${newRoom.room_id}`);
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
		<h1>ようこそ、{name}さん！</h1>
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
		height: 40%;
	}
</style>
