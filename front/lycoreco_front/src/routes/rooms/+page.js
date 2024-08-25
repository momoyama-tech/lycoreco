export async function load({ fetch }) {
	const response = await fetch('https://d5058ded8316.ngrok.app/rooms');
	if (response.ok) {
		const rooms = await response.json();
		console.log(rooms);
		return { props: { rooms } };
	} else {
		throw new Error('Failed to fetch rooms');
	}
}
