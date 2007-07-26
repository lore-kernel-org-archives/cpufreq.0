From: "Dave Young" <hidave.darkstar@gmail.com>
Subject: Re: [PATCH]gx-suspmod.c use boot_cpu_data instead of current_cpu_data
Date: Thu, 26 Jul 2007 04:20:10 +0000
Message-ID: <a8e1da0707252120l5e9e441bm53e2ba25bc9c20f0@mail.gmail.com>
References: <20070725141905.GA4567@darkstar.te-china.tietoenator.com>
	 <20070724234045.2cec5525.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757763AbXGZEU2@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=uHdcF6OIlEnBQHjqLvWcoBYY91xIKs828I3h8Iu1cCCvz00iCfZRn1mRVdSX7uzIUXfTnyZiPO1q68G0rmP9dwBKmad+A+rL5CuDhYEza6gYZNBgYiTFTZiERzzDGQRiZsVgwjiHXfOpdNlezK8AATaIMFM7HSeivP2KyN98wOo=
In-Reply-To: <20070724234045.2cec5525.akpm@linux-foundation.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Dave Jones <davej@codemonkey.org.uk>, cpufreq@www.linux.org.uk

>On 7/25/07, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Wed, 25 Jul 2007 14:19:05 +0000 Dave Young <hidave.darkstar@gmail.com> wrote:
>
> > Hi,
> > in preemptible kernel will report BUG: using smp_processor_id() in preemptible, so use boot_cpu_data instead of current_cpu_data.
> >
> > Signed-off-by: Dave Young <hidave.darkstar@gmail.com>
> >
> > ---
> > arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff -pur linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
> > --- linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c   2007-07-25 14:11:06.000000000 +0000
> > +++ linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c       2007-07-25 13:57:29.000000000 +0000
> > @@ -181,8 +181,8 @@ static __init struct pci_dev *gx_detect_
> >       struct pci_dev *gx_pci = NULL;
> >
> >       /* check if CPU is a MediaGX or a Geode. */
> > -     if ((current_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
> > -         (current_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
> > +     if ((boot_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
> > +         (boot_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
> >               dprintk("error: no MediaGX/Geode processor found!\n");
> >               return NULL;
> >       }
>
> um, I suspect it really wants to get at the current CPU.  But putting a
> preempt_disable() around just that code is meaningless: the current CPU
> could change immediately before or after the code block. It needs deeper
> fixing, methinks.
The only target is to get the cpu vendor, so boot_cpu_data is enough,
the drivers/mtd/nand/cs553x_nand.c has the same usage.
