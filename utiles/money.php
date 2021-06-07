<?php
!defined("MIRESEH") ? exit() : null;

function format_price($str) {
  $str = number_format($str, 0, '.', '٫') . " تومان";
  return $str;
}
