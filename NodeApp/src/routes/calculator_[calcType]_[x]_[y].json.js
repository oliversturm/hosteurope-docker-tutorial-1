const url = process.env.CALCULATOR_URL || 'http://localhost:5150';

export const get = ({ params: { calcType, x, y } }) =>
	fetch(`${url}/calculate?calcType=${calcType}&x=${x}&y=${y}`)
		.then((res) => res.json())
		.then((result) => ({
			body: result
		}));
