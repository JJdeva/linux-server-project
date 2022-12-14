from django.db import models
from django.core.validators import MinLengthValidator
from .validators import validate_symbols

class Post(models.Model):
    # 글의 제목, 내용, 작성일, 마지막 수정일
    title = models.CharField(max_length=50, error_messages={"unique":"이미 있는 제목"})
    content = models.TextField(validators=[MinLengthValidator(10, "너무 짧다 10자이상써줘"),
                                           validate_symbols])
    dt_created = models.DateTimeField(verbose_name='Date Created', auto_now_add=True)
    dt_modified = models.DateTimeField(verbose_name='Date Modified', auto_now=True)
    
    def __str__(self):
        return self.title