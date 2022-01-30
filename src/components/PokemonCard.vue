<template>
  <div class="main">
    <Card>
      <template #header>
          <img
            class="poke_image"
            :class="{ no_brightness: bright }"
            src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png"
            :alt="poke_name"
          />
      </template>
      <template #title>
          <p class="poke_name">{{poke_name_area}}</p>
      </template>
      <template #footer>
        <span class="p-float-label">
          <InputText class="p-inputtext-lg" id="pokemon_input" type="text" v-model="input_name" />
          <label for="pokemon_input">Qual o nome do Pokémon ?</label>
        </span>
        <div class="button_area">
          <Button icon="pi pi-check" class="p-button-rounded p-button-success p-button-outlined" />
          <Button icon="pi pi-times" class="p-button-rounded p-button-danger p-button-outlined" />
          <Button icon="pi pi-caret-right" class="p-button-rounded p-button-outlined" />
        </div>
      </template>
    </Card>
  </div>
</template>

<script>
import Card from 'primevue/card';
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';

export default {
  name: 'PokemonCard',
  components: {
    Card,
    Button,
    InputText,
  },
  data() {
    return {
      bright: true,
      poke_name: 'Scyther',
      poke_name_area: '',
      input_name: '',
    };
  },
  methods: {
    getRandomIntInclusive() {
      const min = 1;
      const max = 386;
      return Math.floor(Math.random() * (max - min + 1)) + min;
    },

    async fetchPokemon(id) {
      const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
      return response.json();
    },

    async generatePokemon() {
      const randomId = this.getRandomIntInclusive();
      const pokemon = await this.fetchPokemon(randomId);
      console.log(pokemon);
    },

    getPokemonNameLength() {
      console.log(this.poke_name.length);
      for (let index = 0; index < this.poke_name.length; index += 1) {
        this.poke_name_area += '_ ';
      }
    },
  },

  mounted() {
    this.getPokemonNameLength();
  },

};
</script>

<style>

.main {
  display: flex;
  justify-content: center;
}

.poke_image {
  width: 275px !important;
}

.no_brightness {
  filter: brightness(0);
}

.poke_name {
  text-align: center;
  color: #3b4cca;
}

.button_area {
  display: flex;
  justify-content: space-between;
  padding: 15px 0;
}

</style>
