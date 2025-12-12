import io
import os
import re
import glob

def buildProto(pbpath, go_out, flutter_out, pattern):
    # 获取匹配的 .proto 文件列表
    proto_files = glob.glob(os.path.join(pbpath, pattern))
    
    for proto_file in proto_files:
        # 获取文件名（不带路径和扩展名）
        file_name = os.path.splitext(os.path.basename(proto_file))[0]
        
        # 构建 protoc 命令生成 Go 文件
        go_cmd = 'protoc --go_out={0} -I{1} {2}'.format(go_out, pbpath, proto_file)
        os.system(go_cmd)
        
        # 构建 protoc 命令生成 Dart（Flutter）文件
        flutter_cmd = 'protoc --dart_out={0} -I{1} {2}'.format(flutter_out, pbpath, proto_file)
        os.system(flutter_cmd)
        
        # 处理 Go 文件中的 tag 标签
        go_file = os.path.join(go_out, file_name + '.pb.go')
        if os.path.exists(go_file):
            file_data = ""
            with io.open(go_file, "r", encoding='utf-8') as f:
                for line in f:
                    if '@go_tags' in line:
                        tags = {}
                        tagsstr = ""
                        # 提取已有的 tag
                        for v in re.findall(r"`(.+?)`", line)[0].split():
                            tag = v.split(':')
                            tags[tag[0]] = tag[1]
                        # 提取 @go_tags 内容
                        go_tags_content = re.findall(r"@go_tags\(\`(.+?)\`\)", line)
                        if go_tags_content:
                            content = go_tags_content[0]
                            # 解析键值对
                            matches = re.findall(r'(\w+):"([^"]*)"', content)
                            for key, value in matches:
                                tags[key] = f"\"{value}\""
                        # 拼接新的 tag 字符串
                        for key, value in tags.items():
                            tagsstr += "{0}:{1} ".format(key, value)
                        # 替换原行中的 tag
                        line = re.sub(r"`([^`]*)`", "`{0}`".format(tagsstr.strip()), line, count=1)
                    file_data += line
            with io.open(go_file, "w", encoding='utf-8') as f:
                f.write(file_data)


# 定义 Go 和 Flutter 的输出目录
GO_OUT_DIR = '../lego_trader/pb'
FLUTTER_OUT_DIR = '../flutter_trader/lib/network/pb'

# 确保输出目录存在
os.makedirs(GO_OUT_DIR, exist_ok=True)
os.makedirs(FLUTTER_OUT_DIR, exist_ok=True)

# 批量生成
buildProto('./proto', GO_OUT_DIR, FLUTTER_OUT_DIR, '*.proto')
buildProto('./proto', GO_OUT_DIR, FLUTTER_OUT_DIR, 'gateway/*.proto')
buildProto('./proto', GO_OUT_DIR, FLUTTER_OUT_DIR, 'user/*.proto')
buildProto('./proto', GO_OUT_DIR, FLUTTER_OUT_DIR, 'stock/*.proto')
buildProto('./proto', GO_OUT_DIR, FLUTTER_OUT_DIR, 'market/*.proto')
