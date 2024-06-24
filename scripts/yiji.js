const { Lunar } = require("./lunar");
const d = Lunar.fromDate(new Date());

const limit = 4;

const ji = d.getDayJi().slice(0, limit).join(" ");
const yi = d.getDayYi().slice(0, limit).join(" ");


function getTodayYiJi() {
  return {
    yi,
    ji,
  };
}

module.exports = {
  getTodayYiJi,
};
