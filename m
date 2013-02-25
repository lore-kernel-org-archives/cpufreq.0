From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: highbank: do not initialize array with a loop
Date: Mon, 25 Feb 2013 09:11:18 +0530
Message-ID: <CAOh2x=nDZpBaqjzO22k66Bb30mVEhAdy02EFDP9RDibA50Sx7A@mail.gmail.com>
References: <1361725277-5125-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=xcswi0SsqjCikR0JdKWkvCNHfiR/dUx0T5m9ph2HCx8=;
        b=faPb3QBVi+7YoG9TtLaxkLPotzbpbEVpg/xiA0Auq2A7wbpRbO2Q30U8sZl6xBIJx2
         cNk4fqhxGe9rvQr24dsdGKpSyPBZn/Zyn/aSQI+68sNVDDEEJK36Cs8Vu+5qYsixb46N
         SoTHdI9e0OpScpxoY9DnJB3r/NbkwGYA0ehrvFojlJGXj7/YQAs+E/Nzy14ENFkrQ9Gy
         Qj6oWkouYoEF18Zy963hOHpy4kj9UYTC8BiuuYTdJ7Qk667w5Lzhe8RnBJmeIFOKdcZQ
         3bUuh25Dj4I31Ul/6fj7hBmyFY5aESL5V4fP+eCJYDIwOp9HNOUMCfcyhYn/sVH3XJtd
         1iig==
In-Reply-To: <1361725277-5125-1-git-send-email-emilio@elopez.com.ar>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Cc: rjw@sisk.pl, shawn.guo@linaro.org, mark.langsdorf@calxeda.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org

On Sun, Feb 24, 2013 at 10:31 PM, Emilio L=F3pez <emilio@elopez.com.ar>=
 wrote:
> As uninitialized array members will be initialized to zero, we can
> avoid using a for loop by setting a value to it.
>
> Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> ---
> Note that I don't own any device using this driver, it has only been =
compile
> tested, but it shouldn't cause any issues.
>
>  drivers/cpufreq/highbank-cpufreq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/hig=
hbank-cpufreq.c
> index 66e3a71..30d4ae1 100644
> --- a/drivers/cpufreq/highbank-cpufreq.c
> +++ b/drivers/cpufreq/highbank-cpufreq.c
> @@ -28,13 +28,9 @@
>
>  static int hb_voltage_change(unsigned int freq)
>  {
> -       int i;
> -       u32 msg[HB_CPUFREQ_IPC_LEN];
> +       u32 msg[HB_CPUFREQ_IPC_LEN] =3D {HB_CPUFREQ_CHANGE_NOTE};
>
> -       msg[0] =3D HB_CPUFREQ_CHANGE_NOTE;
>         msg[1] =3D freq / 1000000;

I think this can also be part of the definition of array, isn't it?

So it would be something like:

u32 msg[HB_CPUFREQ_IPC_LEN] =3D {HB_CPUFREQ_CHANGE_NOTE, freq / 1000000=
};

> -       for (i =3D 2; i < HB_CPUFREQ_IPC_LEN; i++)
> -               msg[i] =3D 0;
>
>         return pl320_ipc_transmit(msg);
>  }
> --
> 1.8.2.rc0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
