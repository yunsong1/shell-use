import os
import glob
from PIL import Image


def process_images(root_dir):
    # 定义需要匹配的图片格式列表
    image_formats = ['*.jpg', '*.png', '*.gif']
    image_paths = []  # 图片路径列表

    # 循环迭代图片格式元素
    for image_format in image_formats:
        # 获取递归目录下的图片路径，'**/'表示递归目录
        subdirectories = glob.glob(os.path.join(root_dir, '**/' + image_format), recursive=True)
        # 将每个元素都添加进列表，而不是作为一个整体append
        image_paths.extend(subdirectories)

    for old_path in image_paths:
        # 打开图像文件
        image = Image.open(old_path)
        # 将图像转换为灰度图像
        gray_image = image.convert('L')
        # 缩放为 128x128 大小
        resized_image = gray_image.resize((128, 128))
        # 替换原始图像文件
        resized_image.save(old_path)


if __name__ == "__main__":
    root_directory = os.path.dirname(os.path.abspath(__file__))
    # 调用函数进行处理
    process_images(root_directory)