<template>
    <v-table >
        <thead>
            <tr>
                <th v-for="header in HeaderNames" :key="header" class="text-left">
                    {{ header }}
                </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="item in items" :key="item.name">
                <td v-for="header in HeaderNames" :key="header">
                    {{ item[header] }}
                </td>
            </tr>
        </tbody>
    </v-table>
</template>

<script>
export default {

    // dynamic table that works with any array of objects created with boredom and love :)

    name: "DataTable",
    props: {
        items: Array
    },
    data() {
        return {
            HeaderNames: []
        }
    },
    mounted() {
       if (this.items.length==0){
        return

       }
console.log('From tables',this.items)
    },
    created() {
        this.HeaderNames = Object.keys(this.items[0]);
        console.log(this.HeaderNames)
    },
    watch: {
  items: {
    handler(newItems) {
      this.HeaderNames = Object.keys(newItems[0]);
    },
    deep: true,
  },
}
}

</script>