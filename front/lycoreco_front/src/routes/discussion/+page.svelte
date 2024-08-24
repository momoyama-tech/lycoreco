<script>
	import Chat from './Chat.svelte';

	const messages = [
		{
			text: "What are you doing?! Let's play now",
			time: '06:20',
			isMine: true,
			date: '14 Apr 2023 06:30'
		},
		{
			text: "I'm not feeling well today",
			time: '06:21',
			isMine: false
		},
		{
			text: 'Uh, okay get well really soon!',
			time: '06:20',
			isMine: true
		},
		{
			text: 'How are you today bro?',
			time: '11:00',
			isMine: true,
			date: 'Yesterday 11:00'
		},
		{
			text: "I'm fine! Wanna play together again?",
			time: '06:21',
			isMine: false
		}
	];
</script>

<main>
	<Chat {messages} />
</main>
