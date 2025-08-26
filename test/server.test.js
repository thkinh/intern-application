const request = require('supertest');
const app = require('../server');

describe('GET /', () => {
  it('should return {status:"ok"}', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.body).toEqual({ status: 'ok' });
  });
});
