import { waitForPromise } from "@ember/test-waiters";

export default async function loadTuaBodyScrollLock() {
  const promise = import("discourse/static/tua-body-scroll-lock-bundle");
  waitForPromise(promise);
  return await promise;
}
