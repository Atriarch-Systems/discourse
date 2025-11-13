import Component from "@glimmer/component";
import { hash } from "@ember/helper";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import willDestroy from "@ember/render-modifiers/modifiers/will-destroy";
import loadTuaBodyScrollLock from "discourse/lib/load-tua-body-scroll-lock";
import ChatScrollableList from "../modifiers/chat/scrollable-list";

export default class ChatMessagesScroller extends Component {
  @action
  async lockBody(element) {
    const bodyScrollLock = await loadTuaBodyScrollLock();
    bodyScrollLock.lock(element);
  }

  @action
  async unlockBody(element) {
    const bodyScrollLock = await loadTuaBodyScrollLock();
    bodyScrollLock.unlock(element);
  }

  <template>
    <div
      class="chat-messages-scroller popper-viewport"
      {{didInsert @onRegisterScroller}}
      {{didInsert this.lockBody}}
      {{willDestroy this.unlockBody}}
      {{ChatScrollableList
        (hash onScroll=@onScroll onScrollEnd=@onScrollEnd reverse=true)
      }}
    >
      {{yield}}
    </div>
  </template>
}
