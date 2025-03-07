<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ResetPasswordNotification extends Notification
{
    use Queueable;
    public $token;
    /**
     * Create a new notification instance.
     */
    public function __construct($token)
    {
        $this->token = $token;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        // Usamos el método correcto: getEmailForPasswordReset()
        $url = env('FRONTEND_URL', 'http://localhost:5173') . '/reset-password?token=' . $this->token . '&email=' . $notifiable->getEmailForPasswordReset();

        return (new MailMessage)
        ->from('agargore.io@gmail.com', 'SUNRISE') 
        ->subject('¡Restablecimiento de contraseña!')
        ->greeting('¡Hola, ' . $notifiable->nombre_completo . '!')  
        ->line('Haz clic en el botón a continuación para restablecer tu contraseña.')
        ->action('Restablecer Contraseña', $url)
        ->line('Si no solicitaste este cambio, por favor ignora este mensaje.')
        ->line('¡Gracias por usar nuestro servicio!')
        ->salutation('Saludos, SUNRISE');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
