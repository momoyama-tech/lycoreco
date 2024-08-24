export async function load({ fetch }) {
	const response = await fetch('http://localhost:3000/rooms');
	if (response.ok) {
		const rooms = await response.json();
		console.log(rooms);
		return { props: { rooms } };
	} else {
		throw new Error('Failed to fetch rooms');
	}
}
