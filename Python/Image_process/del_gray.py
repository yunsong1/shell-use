import os
import glob
import time

def del_images(root_dir):
    # 递归检索方式，获取根目录下的所有图片文件路径
    image_files = glob.glob(os.path.join(root_dir, '**/*.jpg'), recursive=True)

    for old_path in image_files:
        # 提取文件名（不包括路径和扩展名）
        folder_name = os.path.splitext(os.path.basename(old_path))[0]

        #将文件名从倒数第四位开始至最后切片为字符串
        sub_name = folder_name[-4:]
        del_name = 'gray'
        #灰度图片
        if sub_name == del_name:
            # # 删除图片文件
            os.remove(old_path)


if __name__ == "__main__":
    root_directory = os.path.dirname(os.path.abspath(__file__))
    # 调用函数进行重命名
    del_images(root_directory)