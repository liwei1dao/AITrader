import io
import os
import re
import glob

def buildProto(pbpath, outpath, pattern):
    # 获取匹配的 .proto 文件列表
    proto_files = glob.glob(os.path.join(pbpath, pattern))
    
    for proto_file in proto_files:
        # 获取文件名（不带路径和扩展名）
        file_name = os.path.splitext(os.path.basename(proto_file))[0]
        
        # 构建 protoc 命令
        cmdstr = 'protoc --go_out={0} -I{1} {2}'.format(outpath, pbpath, proto_file)
        # print(cmdstr)
        os.system(cmdstr)
        file_data = ""
        file = "{0}/{1}.pb.go".format(outpath,file_name)
        with io.open(file, "r", encoding='utf-8') as f:
            for line in f:
                if '@go_tags' in line:
                    tags = {}
                    tagsstr = ""
                    for v in re.findall(r"`(.+?)`",line)[0].split():
                        tag = v.split(':')
                        tags[tag[0]] = tag[1]
                    go_tags_content = re.findall(r"@go_tags\(\`(.+?)\`\)", line)
                    # print(line)
                    # print(go_tags_content)
                    if go_tags_content:
                        content = go_tags_content[0]                        
                        # 2. 解析键值对
                        matches = re.findall(r'(\w+):"([^"]*)"', content)
                        for key, value in matches:
                             tags[key] = f"\"{value}\""
                    for key,value in tags.items():
                        tagsstr += "{0}:{1} ".format(key,value)
                    # print(tagsstr)
                    line = re.sub(r"`([^`]*)`", "`{0}`".format(tagsstr.strip()), line, count=1)
                file_data += line
        with io.open(file,"w",encoding='utf-8') as f:
            f.write(file_data)


buildProto('./pb/proto','./pb','*.proto')
buildProto('./pb/proto','./pb','gateway/*.proto')
buildProto('./pb/proto','./pb','user/*.proto')
buildProto('./pb/proto','./pb','stock/*.proto')
buildProto('./pb/proto','./pb','market/*.proto')