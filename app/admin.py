from django.contrib import admin
from .models import Lesson, UserProfile, Language, UserLanguage, 
LessonTag, CommunityPost
 
admin.site.register(Lesson, LessonAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(Language, LanguageAdmin)
admin.site.register(UserLanguage, UserLanguageAdmin)
admin.site.register(LessonTag, LessonTagAdmin)
admin.site.register(CommunityPost, CommunityPostAdmin)


