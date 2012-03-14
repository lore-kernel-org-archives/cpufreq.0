From: Grazvydas Ignotas <notasas@gmail.com>
Subject: Re: [GIT PULL] cpufreq: OMAP updates for v3.4
Date: Wed, 14 Mar 2012 18:41:51 +0200
Message-ID: <CANOLnON91vXWb2L-FXjz3sqq-9j5SaEodtpt_yvFiN33D4Q3Ow@mail.gmail.com>
References: <87y5rci2na.fsf@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=dZ/lUgPEbQcTaO5A3aa43TERi1NzcNrDGItscwF5CL0=;
        b=tkmYi7HZxgPU6PEhmWgrJ3jdJgDlJQcErvmz0Bwnu/vhc8F/qUafjNw9WNFJPNdxon
         1/PRZm4WdzukhEEp2CSfYiW8sRXLqBIdsdLvSeXzbRPDzpcaY0KaYTyMeBdqeXbpReXQ
         bUu4NuJFbFaeyXMxtA2ZviXUD/8eNtQzBlRX4tjS4Q0z6/fFhYWoqNTNAzccUD89A1v0
         UYedkDdHI4QleBIwc550wcdNMpsWELOoI0y8w2LhGdrpSNPX2sLDMxhb8p6s7FAmwQLs
         a32fTHGbkyFAGIoxTym6mAowh4HpXL8ozRaBY+6w9wjUAClKgdryDaYxSUWQKgrkNk0t
         LiqA==
In-Reply-To: <87y5rci2na.fsf@ti.com>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kevin Hilman <khilman@ti.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, Mar 7, 2012 at 10:20 PM, Kevin Hilman <khilman@ti.com> wrote:
> Dave,
>
> Please pull the following OMAP CPUfreq driver changes for v3.4.
>
> Thanks,
>
> Kevin
>
>
>
> The following changes since commit b01543dfe67bb1d191998e90d20534dc35=
4de059:
>
> =C2=A0Linux 3.3-rc4 (2012-02-18 15:53:33 -0800)
>
> are available in the git repository at:
>
> =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-oma=
p-pm.git for_3.4/cpufreq
>
> for you to fetch changes up to 42daffd2d6c665716d442d518022ecaad17ddf=
64:
>
> =C2=A0cpufreq: OMAP: specify range for voltage scaling (2012-03-02 13=
:55:57 -0800)
>
> ----------------------------------------------------------------
> Afzal Mohammed (1):
> =C2=A0 =C2=A0 =C2=A0cpufreq: OMAP: specify range for voltage scaling
>
> Kevin Hilman (1):
> =C2=A0 =C2=A0 =C2=A0cpufreq: OMAP: scale voltage along with frequency
>
> Russell King (1):
> =C2=A0 =C2=A0 =C2=A0cpufreq: OMAP driver depends CPUfreq tables

It seems this one got messed up, it says "default ARCH_OMAP2PLUS"
instead of depends.
Can it be dropped and resent, or do we need a fixup patch?

--=20
Gra=C5=BEvydas
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
