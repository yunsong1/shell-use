import os
import glob

def rename_images(root_dir):
    # 递归方式，获取根目录下的所有子文件夹路径
    subdirectories = glob.glob(os.path.join(root_dir, '**/'), recursive=True)

    #循环迭代每个子文件夹
    for subdir in subdirectories:
        # 获取当前子文件夹的名称
        folder_name = os.path.basename(os.path.normpath(subdir))

        # 返回当前子文件夹下的所有图片文件路径列表
        image_files = glob.glob(os.path.join(subdir, '*.jpg'))

        # 初始化计数器
        count = 0

        #循环迭代每个子文件夹图片路径
        for old_path in image_files:
            # 获取文件扩展名(后缀)
            ext = os.path.splitext(old_path)[1]
            # 构建新的文件名
            # new_filename = f"{folder_name}_{count}{ext}"
            new_filename = f"image_{count}{ext}"

            # 构建新的文件路径
            new_path = os.path.join(subdir, new_filename)
            # 重命名文件
            os.rename(old_path, new_path)
            print(f"Renamed: {old_path} -> {new_path}")

            # 计数器递增
            count += 1


if __name__ == "__main__":
    root_directory = os.path.dirname(os.path.abspath(__file__))
    # 调用函数进行重命名
    rename_images(root_directory)