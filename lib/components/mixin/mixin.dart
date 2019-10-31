mixin YXMergeable<T> {
  T merge(T override);
}

mixin YXProps<T, U> {
  T fromProps(U props);
}
