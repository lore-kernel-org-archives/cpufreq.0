From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: RE: [PATCH] mailbox: prevent pl320-ipc code from breaking none-AMBA
 systems
Date: Tue, 29 Jan 2013 17:13:09 -0500
Message-ID: <21672683C5A3814BB4DB938EBE482DE435D976610A@IAD2MBX09.mex02.mlsrvr.com>
References: <1359477413-27881-1-git-send-email-mark.langsdorf@calxeda.com>,<1807311.dyJeq56cRL@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1807311.dyJeq56cRL@vostro.rjw.lan>
Content-Language: en-US
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> From: Rafael J. Wysocki [rjw@sisk.pl]
> On Tuesday, January 29, 2013 10:36:53 AM Mark Langsdorf wrote:
> > The pl320-ipc code depends on ARM AMBA, and should have the dependency
> > in its Kconfig.
> 
> May I fold this into "ARM / highbank: add support for pl320 IPC"?

Yes. I didn't want to regenerate the patch series =)

--Mark Langsdorf
Calxeda, Inc.

> Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>
> ---
>  drivers/mailbox/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 9489554..9545c9f 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -8,6 +8,7 @@ menuconfig MAILBOX
>  if MAILBOX
>  config PL320_MBOX
>       bool "ARM PL320 Mailbox"
> +     depends on ARM_AMBA
>       help
>         An implementation of the ARM PL320 Interprocessor Communication
>         Mailbox (IPCM), tailored for the Calxeda Highbank. It is used to
>
--
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.