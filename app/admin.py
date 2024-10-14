from django.contrib import admin
from .models import Lesson, UserProfile, Language, UserLanguage, 
LessonTag, CommunityPost

class LessonAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'language', 'created_at')
    list_filter = ('language', 'tags')
    search_fields = ('title', 'description')
    ordering = ('-created_at',)

class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'bio', 'location', 'birth_date')
    search_fields = ('user__username', 'bio')
    ordering = ('user',)
    
class LanguageAdmin(admin.ModelAdmin):
    list_display = ('name', 'code')
    search_fields = ('name',)
    
admin.site.register(Lesson, LessonAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(Language, LanguageAdmin)
admin.site.register(UserLanguage, UserLanguageAdmin)
admin.site.register(LessonTag, LessonTagAdmin)
admin.site.register(CommunityPost, CommunityPostAdmin)


