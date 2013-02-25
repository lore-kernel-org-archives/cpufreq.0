From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: highbank: do not initialize array with a loop
Date: Mon, 25 Feb 2013 16:42:27 +0530
Message-ID: <CAOh2x=nZ9hsTx+kay0Le-qVJLeh3vTY2eUHW7hHdVQV_eXc4yw@mail.gmail.com>
References: <1361725277-5125-1-git-send-email-emilio@elopez.com.ar>
	<1361790465-21760-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=nstrn3kXtFqHR/ozRd7JeZcKbsEaEYlDqY6vTUDAhtA=;
        b=a8z+f++JE84WV529wiOnCsBowmCFyNXmUKaEyGgyxCjfRsJOm/sTPqDBxNQkjc1CDu
         jbR53A9zVhVH8RE5dago0LmcEI1qiQLR9i/YwYyx790XvxC6+sQUWCDxVlg339hgwYe1
         IMF/Q98dnGKQvEU4fTBadGz4iAuglE80hO3u/KUbUIYlqEZvRknyMbv8vjxFBROO2Q6O
         wuWR5qdlPbR+X5F5P+vi8Hid0ICLS1F2NDX+tlaj7hvXCMijIo1k5FLuYVKGREhCzTsq
         vqpezFceI9HUnHKtvK+oIfUMuJB4nO6kq73iBAez7MSVScr48iTV+enPHUoxnmqOAAjl
         ybHg==
In-Reply-To: <1361790465-21760-1-git-send-email-emilio@elopez.com.ar>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Cc: rjw@sisk.pl, shawn.guo@linaro.org, mark.langsdorf@calxeda.com, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 25, 2013 at 4:37 PM, Emilio L=F3pez <emilio@elopez.com.ar> =
wrote:
> As uninitialized array members will be initialized to zero, we can
> avoid using a for loop by setting a value to it.
>
> Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> ---
>
> Note that I don't own any device using this driver, it has only been =
compile
> tested, but it shouldn't cause any issues.
>
> Changes v1 -> v2:
>   * Move freq / 1000000 to the array definition as suggested by Vires=
h Kumar
>
>  drivers/cpufreq/highbank-cpufreq.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/hig=
hbank-cpufreq.c
> index 66e3a71..b61b5a3 100644
> --- a/drivers/cpufreq/highbank-cpufreq.c
> +++ b/drivers/cpufreq/highbank-cpufreq.c
> @@ -28,13 +28,7 @@
>
>  static int hb_voltage_change(unsigned int freq)
>  {
> -       int i;
> -       u32 msg[HB_CPUFREQ_IPC_LEN];
> -
> -       msg[0] =3D HB_CPUFREQ_CHANGE_NOTE;
> -       msg[1] =3D freq / 1000000;
> -       for (i =3D 2; i < HB_CPUFREQ_IPC_LEN; i++)
> -               msg[i] =3D 0;
> +       u32 msg[HB_CPUFREQ_IPC_LEN] =3D {HB_CPUFREQ_CHANGE_NOTE, freq=
 / 1000000};

If you haven't crossed 80 width:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

>
>         return pl320_ipc_transmit(msg);
>  }
