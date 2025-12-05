package akshare

import (
	"fmt"
	"reflect"
	"strconv"
	"strings"
	"time"
)

// 注：不再使用中文别名映射，直接按 item 与 json 标签一致进行映射

// toStr 将任意类型转换为字符串
func toStr(v interface{}) string {
	if v == nil {
		return ""
	}
	switch x := v.(type) {
	case string:
		return x
	default:
		return fmt.Sprint(v)
	}
}

// toIntAny 将任意类型转换为 int
func toIntAny(v interface{}) int {
	if v == nil {
		return 0
	}
	switch x := v.(type) {
	case float64:
		return int(x)
	case int:
		return x
	case int64:
		return int(x)
	case string:
		if x == "" {
			return 0
		}
		if i, err := strconv.Atoi(x); err == nil {
			return i
		}
		return 0
	default:
		s := fmt.Sprint(v)
		if i, err := strconv.Atoi(s); err == nil {
			return i
		}
		return 0
	}
}

// toFloatAny 将任意类型转换为 float64
func toFloatAny(v interface{}) float64 {
	if v == nil {
		return 0
	}
	switch x := v.(type) {
	case float64:
		return x
	case float32:
		return float64(x)
	case int:
		return float64(x)
	case int64:
		return float64(x)
	case string:
		if x == "" {
			return 0
		}
		if f, err := strconv.ParseFloat(x, 64); err == nil {
			return f
		}
		return 0
	default:
		s := fmt.Sprint(v)
		if f, err := strconv.ParseFloat(s, 64); err == nil {
			return f
		}
		return 0
	}
}

// toMsAny 将任意类型转换为毫秒时间戳
func toMsAny(v interface{}) int64 {
	if v == nil {
		return 0
	}
	msFromNumeric := func(x int64) int64 {
		// 10位：秒；13位：毫秒；8位：YYYYMMDD
		if x >= 1_000_000_000 && x <= 9_999_999_999 { // seconds
			return x * 1000
		}
		if x >= 1_000_000_000_000 && x <= 9_999_999_999_999 { // milliseconds
			return x
		}
		if x >= 101_010_10 && x <= 9999_12_31 { // YYYYMMDD as int
			s := fmt.Sprintf("%08d", x)
			if t, err := time.Parse("20060102", s); err == nil {
				return t.UnixMilli()
			}
			return 0
		}
		return 0
	}
	msFromString := func(s string) int64 {
		if s == "" {
			return 0
		}
		// numeric string
		if i, err := strconv.ParseInt(s, 10, 64); err == nil {
			return msFromNumeric(i)
		}
		// YYYY-MM-DD
		if t, err := time.Parse("2006-01-02", s); err == nil {
			return t.UnixMilli()
		}
		// YYYY/MM/DD
		if t, err := time.Parse("2006/01/02", s); err == nil {
			return t.UnixMilli()
		}
		// YYYYMMDD
		if t, err := time.Parse("20060102", s); err == nil {
			return t.UnixMilli()
		}
		return 0
	}
	switch x := v.(type) {
	case float64:
		return msFromNumeric(int64(x))
	case int64:
		return msFromNumeric(x)
	case int:
		return msFromNumeric(int64(x))
	case string:
		return msFromString(x)
	default:
		return msFromString(toStr(v))
	}
}

// MapItemValuesToStruct 将 []ItemValue 按结构体字段的 json 标签反射赋值到目标对象
// - 支持 string/int/int64/float64/*string
// - 对 json 标签为 "established_date"/"listed_date" 的字段，按时间戳毫秒解析
func MapItemValuesToStruct(items []ItemValue, dst interface{}) error {
	if dst == nil {
		return fmt.Errorf("dst is nil")
	}
	rv := reflect.ValueOf(dst)
	if rv.Kind() != reflect.Ptr || rv.Elem().Kind() != reflect.Struct {
		return fmt.Errorf("dst must be pointer to struct")
	}
	// 容器化：当 value 为对象/数组时，递归展开为子 items 再映射
	kv := make(map[string]interface{}, len(items))
	for _, it := range items {
		k := strings.TrimSpace(it.Item)
		if k == "" {
			continue
		}
		v := it.Value
		switch x := v.(type) {
		case map[string]interface{}:
			// 对象：展开为子 items 并递归映射
			sub := make([]ItemValue, 0, len(x))
			for sk, sv := range x {
				sub = append(sub, ItemValue{Item: sk, Value: sv})
			}
			_ = MapItemValuesToStruct(sub, dst)
			continue
		case []map[string]interface{}:
			for _, mm := range x {
				sub := make([]ItemValue, 0, len(mm))
				for sk, sv := range mm {
					sub = append(sub, ItemValue{Item: sk, Value: sv})
				}
				_ = MapItemValuesToStruct(sub, dst)
			}
			continue
		case []interface{}:
			for _, elem := range x {
				if mm, ok := elem.(map[string]interface{}); ok {
					// 识别 {item:..., value:...} 的条目
					if ivItem, hasItem := mm["item"]; hasItem {
						if subVal, hasVal := mm["value"]; hasVal {
							_ = MapItemValuesToStruct([]ItemValue{{Item: toStr(ivItem), Value: subVal}}, dst)
							continue
						}
					}
					// 普通对象：展开键值
					sub := make([]ItemValue, 0, len(mm))
					for sk, sv := range mm {
						sub = append(sub, ItemValue{Item: sk, Value: sv})
					}
					_ = MapItemValuesToStruct(sub, dst)
				}
			}
			continue
		}
		kv[k] = v
	}
	// 反射映射
	sv := rv.Elem()
	st := sv.Type()
	for i := 0; i < st.NumField(); i++ {
		f := st.Field(i)
		tag := f.Tag.Get("json")
		if tag == "" || tag == "-" {
			continue
		}
		val, ok := kv[tag]
		if !ok {
			continue
		}
		fv := sv.Field(i)
		if !fv.CanSet() {
			continue
		}
		switch fv.Kind() {
		case reflect.String:
			fv.SetString(toStr(val))
		case reflect.Int:
			fv.SetInt(int64(toIntAny(val)))
		case reflect.Int64:
			// 时间字段按毫秒解析，其余按整数解析
			if tag == "established_date" || tag == "listed_date" {
				fv.SetInt(toMsAny(val))
			} else {
				fv.SetInt(int64(toIntAny(val)))
			}
		case reflect.Float64:
			fv.SetFloat(toFloatAny(val))
		case reflect.Ptr:
			if f.Type.Elem().Kind() == reflect.String {
				s := toStr(val)
				if s == "" || strings.EqualFold(s, "null") {
					fv.Set(reflect.Zero(f.Type))
				} else {
					fv.Set(reflect.ValueOf(&s))
				}
			}
		}
	}
	return nil
}
