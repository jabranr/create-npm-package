import { expect, test } from 'vitest';
import add from './index.js';

test('add', () => {
  expect(add(1, 2)).toEqual(3);
});
