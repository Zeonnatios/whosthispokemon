<template>
  <div class="header">
    <h1>Quem é esse Pokémon ???</h1>
  </div>
</template>

<script>
export default {
  name: 'TheHeading',
};
</script>

<style scoped>
  .header {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 80px;
    width: 100%;
    padding: 50px;
    font-size: 20px;
    color: #ffde00;
    -webkit-text-stroke-width: 3px;
    -webkit-text-stroke-color: #3b4cca;
    letter-spacing: 7px;
    text-align: center;
  }
</style>
