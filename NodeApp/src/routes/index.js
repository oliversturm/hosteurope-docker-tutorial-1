import { MongoClient } from 'mongodb';

const url = process.env.MONGODB_URL || 'mongodb://localhost:27017';
const client = new MongoClient(url);
const dbname = process.env.MONGODB_NAME || 'sktestapp';

const getCollection = () => client.connect().then(() => client.db(dbname).collection('rows'));

export const get = () =>
	getCollection()
		.then((coll) => coll.find({}).toArray())
		.then((rows) => ({ body: { rows } }));

export const post = ({ request }) =>
	request.formData().then((formData) => {
		const data = Object.fromEntries(formData);
		return getCollection().then((coll) => coll.insertOne(data));
	});
