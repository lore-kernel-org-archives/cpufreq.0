From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] Add cpufreq driver for Momentum Maple boards
Date: Mon, 30 May 2011 15:57:17 +0400
Message-ID: <BANLkTikGyV8aG1twBt7Jt_=j-fSBDiGzAg@mail.gmail.com>
References: <1305973726-28006-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=7oo52L5XQuHgy6c5vFuKyTVSGUNDW8Qmq3KfFzss+Aw=;
        b=NvpXshvgAntuX+bMPjCS7fvPNzXFqWO+tPsNxCZpE6WJeK9rOK2b/jBv2OihyuOzEc
         k8RGSru/bFrK3EQYHiix6AyhjWR7I2a4qNvC1JC7A6WARjGRCEOdenqL0xkUD5fRn/I4
         JKvlJJCcKPWYyuQUmVLxDlA1VH5/qcdoUnHWE=
In-Reply-To: <1305973726-28006-1-git-send-email-dbaryshkov@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Hello,

On 5/21/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> Add simple cpufreq driver for Maple-based boards (ppc970fx evaluation
> kit and others). Driver is based on a cpufreq driver for 64-bit powermac
> boxes with all pmac-dependant features removed and simple cleanup
> applied.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  arch/powerpc/kernel/misc_64.S          |    4 +-
>  arch/powerpc/platforms/Kconfig         |    8 +
>  arch/powerpc/platforms/maple/Makefile  |    1 +
>  arch/powerpc/platforms/maple/cpufreq.c |  317
> ++++++++++++++++++++++++++++++++
>  4 files changed, 328 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/platforms/maple/cpufreq.c

What about this patch?

-- 
With best wishes
Dmitry
