<template>
  <Toast />
  <div class="main">
    <Card>
      <template #header>
          <img
            class="poke_image"
            :class="{ no_brightness: bright }"
            :src="poke_image"
            :alt="poke_name"
          />
      </template>
      <template #title>
          <p class="poke_name">{{poke_name_area}}</p>
      </template>
      <template #footer>
        <span class="p-float-label">
          <InputText
            class="p-inputtext-lg"
            id="pokemon_input"
            type="text"
            v-model="input_name"
            :disabled="disabled"
          />
          <label for="pokemon_input">Qual o nome do Pokémon ?</label>
        </span>
        <div class="button_area">
          <Button
            icon="pi pi-check"
            class="p-button-rounded p-button-success p-button-outlined"
            @click="confirmPokemon"
          />
          <Button
            icon="pi pi-times"
            class="p-button-rounded p-button-danger p-button-outlined"
            @click="clear"
          />
          <Button
            icon="pi pi-caret-right"
            class="p-button-rounded p-button-outlined"
            @click="nextPokemon"
          />
        </div>
      </template>
    </Card>
  </div>
</template>

<script>

import Card from 'primevue/card';
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';
import Toast from 'primevue/toast';

export default {
  name: 'PokemonCard',
  components: {
    Card,
    Button,
    InputText,
    Toast,
  },

  data() {
    return {
      bright: true,
      poke_name: '',
      poke_image: '',
      poke_name_area: '',
      input_name: '',
      pokemon: '',
      disabled: false,
      messages: {
        success: {
          severity: 'success', summary: 'Parabéns', detail: 'Parabéns, você acertou :)', life: 3000,
        },
        info: {
          severity: 'info', summary: 'OPS...', detail: 'Você precisa digitar um nome de pokémon :)', life: 3000,
        },
        error: {
          severity: 'error', summary: 'Não foi dessa vez', detail: 'Vocẽ pode tentar denovo :)', life: 3000,
        },
      },
    };
  },

  methods: {

    getRandomIntInclusive() {
      const min = 1;
      const max = 386;
      return Math.floor(Math.random() * (max - min + 1)) + min;
    },

    generateHiddenName() {
      this.poke_name_area = '';
      for (let index = 0; index < this.poke_name.length; index += 1) {
        this.poke_name_area += '_ ';
      }
    },

    async fetchPokemon(id) {
      const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
      return response.json();
    },

    insertPokemon(data) {
      this.pokemon = data;
      this.poke_name = data.name;
      this.poke_image = data.sprites.other['official-artwork'].front_default;
    },

    async generatePokemon() {
      this.bright = true;
      const randomId = this.getRandomIntInclusive();
      const dataPokemon = await this.fetchPokemon(randomId);
      this.insertPokemon(dataPokemon);
      this.generateHiddenName();
    },

    showSuccess() {
      this.$toast.add(this.$toast.add(this.messages.success));
      this.disabled = true;
    },
    showInfo() {
      this.$toast.add(this.$toast.add(this.messages.info));
    },
    showError() {
      this.$toast.add(this.$toast.add(this.messages.error));
      this.disabled = true;
    },

    showResult() {
      this.bright = false;
      this.poke_name_area = this.poke_name;
    },

    confirmPokemon() {
      if (this.input_name.length === 0) this.showInfo();
      if (this.input_name !== this.poke_name) {
        this.showResult();
        this.showError();
      }
      if (this.input_name === this.poke_name) {
        this.showResult();
        this.showSuccess();
      }
    },

    clear() {
      this.input_name = '';
    },

    async nextPokemon() {
      this.clear();
      await this.generatePokemon();
      this.disabled = false;
    },

  },

  mounted() {
    this.generatePokemon();
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
