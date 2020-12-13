package androidx.databinding;

public class DataBinderMapperImpl extends MergedDataBinderMapper {
  DataBinderMapperImpl() {
    addMapper(new com.example.mrfarmergrocer2.DataBinderMapperImpl());
  }
}
