from django.http import JsonResponse


def health_check(request):
    """
    Simple health check endpoint that returns the status of the application.
    """
    return JsonResponse({
        'status': 'healthy',
        'message': 'Application is running'
    })
