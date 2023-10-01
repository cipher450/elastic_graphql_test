import { createApp, h, provide } from "vue";
import App from "./App.vue";
import "vuetify/styles";
import { createVuetify } from "vuetify";
import * as components from "vuetify/components";
import * as directives from "vuetify/directives";
import "@/styles.css";
import apolloClient from "./apollo/apollo";
import { DefaultApolloClient } from "@vue/apollo-composable";
 
const vuetify = createVuetify({
  components,
  directives,
});

const app = createApp({
  setup(){
    provide(DefaultApolloClient,apolloClient)
  },
  render:()=>h(App)
});
app.use(vuetify);
app.mount("#app");
