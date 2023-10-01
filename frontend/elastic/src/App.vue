<template >
  <div class="p-3">
    <v-layout>
      <v-navigation-drawer v-model="drawer" location="left" class="p-3" :width="350">
        <v-text-field label="Product name" variant="underlined" v-model="searchInput"></v-text-field>
        <div class="flex flex-col  w-80 gap-2">
          <div class="flex flex-col items-left gap-2">
            <span>Price </span>
            <v-range-slider v-model="filtre.priceRang" :max="3000" :min="90" :step="1" hide-details class="align-center">
              <template v-slot:prepend>
                <v-text-field v-model="filtre.priceRang[0]" hide-details single-line type="number" variant="outlined"
                  density="compact" style="width: 70px"></v-text-field>
              </template>
              <template v-slot:append>
                <v-text-field v-model="filtre.priceRang[1]" hide-details single-line type="number" variant="outlined"
                  style="width: 80px" density="compact"></v-text-field>
              </template>
            </v-range-slider>
          </div>
          <div class="flex flex-col items-left gap-2">
            <span>Quantity </span>

            <v-range-slider v-model="filtre.quantityRang" :max="3000" :min="90" :step="1" hide-details
              class="align-center">
              <template v-slot:prepend>
                <v-text-field v-model="filtre.quantityRang[0]" hide-details single-line type="number" variant="outlined"
                  density="compact" style="width: 70px"></v-text-field>
              </template>
              <template v-slot:append>
                <v-text-field v-model="filtre.quantityRang[1]" hide-details single-line type="number" variant="outlined"
                  style="width: 70px" density="compact"></v-text-field>
              </template>
            </v-range-slider>
          </div>
          <v-switch v-model="filtre.isAvailable" label="isAvailable" hide-details></v-switch>

          <v-divider inset></v-divider>

          <v-text-field label="Page size" variant="underlined" v-model="filtre.pageSize" type="number"></v-text-field>
          <v-btn v-on:click="filtreProducts()" color="green">
            Show all
          </v-btn>
        </div>
      </v-navigation-drawer>
    </v-layout>



    <div class="flex f  items-center gap-2 ">
      <v-text-field label="Product name (search works while typing with delay of 1 sec)" variant="underlined" v-model="searchInput" @input="delayInput"></v-text-field>


      <div class="flex gap-2 ">


        <v-btn v-on:click="fetchProducts">
          Show all
        </v-btn>
        <v-btn @click.stop="drawer = !drawer" color="orange">
          Filtre
        </v-btn>
      </div>
    </div>
    <DataTable :items="items" />

  </div>
</template>


<script >
import DataTable from '@/components/DataTable.vue'
import { GET_ALL_PRODUCTS, GET_PRODUCT_BY_NAME_SUGGESTION, FILTRE_PRODUCTS } from '@/apollo/queries'
import { useQuery } from '@vue/apollo-composable'
import { provideApolloClient } from '@vue/apollo-composable'
import apolloClient from '@/apollo/apollo'
provideApolloClient(apolloClient)



export default {
  name: 'App',


  components: {
    DataTable
  },
  data() {

    return {
      drawer: false,
      items: [
        {
          _id: 'fff',
          authors: '125',
          isbn: '125',
          title: '125',
          publication_date: '125',
        },
        {
          _id: 'fff',
          authors: '125',
          isbn: '125',
          title: '125',
          publication_date: '125',
        },
        {
          _id: 'fff',
          authors: '125',
          isbn: '125',
          title: '125',
          publication_date: '125',
        },

      ],
      filtre: {
        priceRang: [80, 200],//min - max
        quantityRang: [10, 100],//min - max
        isAvailable: true,
        pageSize: 10
      },
      searchInput: '',
      delayTime: null
    }

  },

  methods: {
    delayInput() {
      // tried to do real time search while typing...
      clearTimeout(this.delayTime);


      this.delayTime = setTimeout(() => {
        this.handleInput();
      }, 1000);
    },
    async handleInput() {
      if (this.searchInput != undefined) {
        const { result } = useQuery(GET_PRODUCT_BY_NAME_SUGGESTION, {
          productName: this.searchInput,
        });
        console.log(this.items)
        this.$watch(
          () => result.value,
          (newValue) => {
            if (newValue && newValue.getProductByName) {
              console.log('Products fetched:', newValue.getProductByName);
              this.items = newValue.getProductByName;
            }
          })
       
      }else{
        this.fetchProducts()
      }

    },
    async fetchProducts() {
      const { result } = useQuery(GET_ALL_PRODUCTS);
      this.$watch(
        () => result.value,
        (newValue) => {
          if (newValue && newValue.getAllProducts) {
            console.log('Products fetched:', newValue.getAllProducts);
            this.items = newValue.getAllProducts;
          }
        }
      )
    },
    async filtreProducts() {
      this.drawer = false
      const { result } = useQuery(FILTRE_PRODUCTS, {
        searchTerm: this.searchInput,
        minPrice: Number(this.filtre.priceRang[0]), // 0 = min
        maxPrice: Number(this.filtre.priceRang[1]),
        minQuantity: Number(this.filtre.quantityRang[0]),
        maxQuantity: Number(this.filtre.quantityRang[1]),
        isAvailable: this.filtre.isAvailable,
        pageSize: this.filtre.pageSize
      });
      
      this.$watch(
          () => result.value,
          (newValue) => {
            if (newValue && newValue.filtreProducts) {
              console.log('Products fetched:', newValue.filtreProducts);
              this.items = newValue.filtreProducts;
            }
          })
    }
  },
  created() {
    this.fetchProducts();

  },

  watch: {
    group() {
      this.drawer = false
    },

  },
}

</script>


<style></style>