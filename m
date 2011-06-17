From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] Add cpufreq driver for Momentum Maple boards
Date: Fri, 17 Jun 2011 15:12:56 +0400
Message-ID: <BANLkTimo6k=Zz+QnP0VaWYf3jDjpFXNL4w@mail.gmail.com>
References: <1308284088.32158.0.camel@pasglop>
	<1308300556-4463-1-git-send-email-dbaryshkov@gmail.com>
	<201106171117.14794.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=m9zmPP6sNNIvLYuRFH7dgiCBCAKXVQZXICGWQQVkISY=;
        b=KEZ7MrBIkpPBaeu86kuWjaQN/MrwhTv1zckzjprcTUdIBg2ifx65hGY/GghWIE5Asm
         Gnv7htU2N9NDS7BpYCVr+gEEPdRlBde8vCmU/kIzJNnQzI10/rMrVJFDiL6SKDj8w5ax
         YEfRllBagri0zvGHmHRoBZwILT36YaCBVHg4U=
In-Reply-To: <201106171117.14794.arnd@arndb.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org, davej@redhat.com, paulus@samba.org, cpufreq@vger.kernel.org

Hello,

On 6/17/11, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 17 June 2011 10:49:16 Dmitry Eremin-Solenikov wrote:
>> Add simple cpufreq driver for Maple-based boards (ppc970fx evaluation
>> kit and others). Driver is based on a cpufreq driver for 64-bit powermac
>> boxes with all pmac-dependant features removed and simple cleanup
>> applied.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>>  arch/powerpc/kernel/misc_64.S          |    4 +-
>>  arch/powerpc/platforms/Kconfig         |    8 +
>>  arch/powerpc/platforms/maple/Makefile  |    1 +
>>  arch/powerpc/platforms/maple/cpufreq.c |  317
>> ++++++++++++++++++++++++++++++++
>>  4 files changed, 328 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/powerpc/platforms/maple/cpufreq.c
>>
>
>
> I think new cpufreq drivers should live in drivers/cpufreq, not in arch/.
> We've
> started moving other drivers away from arch/x86 and arch/arm already.

What about drivers/cpufreq/powerpc, or it's an unnecessary?

Should I resumbit it, or there will be massive arch/powerpc ->
drivers/cpufreq move?

-- 
With best wishes
Dmitry
