// typedef for a function that creates an instance of type T
// consumer naver know how the instance is created
// Dependency Injection without libraries
typedef Create<T> = T Function();

class Provider<T> {
  final Create<T> _create;
  T? _instance;

  Provider(this._create);

  T get() {
    _instance ??= _create();
    return _instance!;
  }
}

// _instance is null at first
// when get() is called first time, _create() is invoked to create the instance
// the object is stored in _instance
// next time get() is called, the stored instance is returned
// thus ensuring a single instance (singleton) per Provider<T>
