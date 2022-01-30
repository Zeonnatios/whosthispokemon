<template>
  <TheHeading />
  <PokemonCard />
</template>

<script>

import TheHeading from '@/components/TheHeading.vue';
import PokemonCard from '@/components/PokemonCard.vue';

export default {
  name: 'Home',
  components: {
    TheHeading,
    PokemonCard,
  },
};
</script>
