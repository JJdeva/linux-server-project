from django import forms
from .models import Post
from .validators import validate_symbols
from django.core.exceptions import ValidationError

class PostForm(forms.ModelForm):
    
    class Meta:
        model = Post
        fields = ['title', 'content'] # 모든 field를 적용하고 싶으면 "__all__" 이라하면된다.
        widgets = {'title': forms.TextInput(attrs={'class':'title',
                                                   'placeholder':'제목을 입력하세요.'}),
                   'content': forms.Textarea(attrs={'class':'content', 
                                                    'placeholder' : '내용을 입력하세요.'})}
            # css를 적용하기 위해 위젯을 설정
        
    def clean_title(self):
        title = self.cleaned_data['title']
        if '*' in title:
            raise ValidationError("*은 포함 불가능하다.")
        return title