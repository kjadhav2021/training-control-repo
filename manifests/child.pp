# a sample class to presenting inherits keyword
class child inherits parents {
  notify {"printing var_parent in child class : ${var_parent}":}
  $var_parent = 'override inside child class'
  notify {"printing var_parent after override in child class : ${var_parent}":}

}
